## Lambda
# Generates IAM policy in JSON format for the IAM role that will be attached to the Lambda Function
data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com", "edgelambda.amazonaws.com"]
    }
  }
}

# Create the IAM role that will be attached to the Lambda Function and associate it with the previously created policy
resource "aws_iam_role" "lambda_exec_role_cloudfront_redirect" {
  name = "LambdaExecRoleCloudFrontRedirect"
  path = "/services-roles/"

  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json

  tags = {
    ManagedBy = "terraform"
    Changed   = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

# Attach the predefined AWSLambdaBasicExecutionRole to grant permission to the Lambda execution role to see the CloudWatch logs generated when CloudFront triggers the function.
resource "aws_iam_role_policy_attachment" "lambda_exec_role_cloudwatch_policy" {
  role       = aws_iam_role.lambda_exec_role_cloudfront_redirect.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Generates a ZIP archive from the Javascript script
data "archive_file" "cloudfront_folder_index_redirect_code" {
  type        = "zip"
  source_file = "${path.module}/lambda/cloudfront_folder_index_redirect.js"
  output_path = "${path.module}/lambda/cloudfront_folder_index_redirect.js.zip"
}

# Creates the Lambda Function
resource "aws_lambda_function" "website_lambda_redirect_folder_index" {
  provider         = aws.us-east-1 # Lambda@Edge invoked by CloudFront must reside in us-east-1
  function_name    = "cloudfront-folder-index-redirect"
  description      = "Implements Default Directory Indexes in Amazon S3-backed Amazon CloudFront Origins"
  handler          = "cloudfront_folder_index_redirect.handler"
  filename         = data.archive_file.cloudfront_folder_index_redirect_code.output_path
  source_code_hash = data.archive_file.cloudfront_folder_index_redirect_code.output_base64sha256
  role             = aws_iam_role.lambda_exec_role_cloudfront_redirect.arn
  runtime          = "nodejs10.x"
  timeout          = "30" # 30 seconds is the MAXIMUM allowed for functions triggered by a CloudFront event
  publish          = true

  tags = {
    ManagedBy = "terraform"
    Changed   = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
