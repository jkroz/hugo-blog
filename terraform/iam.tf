resource "aws_iam_user" "jsstest" {
  name = "jsstest"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "jsstest" {
  user = "${aws_iam_user.jsstest.name}"
}

resource "aws_iam_user_policy" "jsstest_ci" {
  name = "${aws_iam_user.jsstest.name}-allow-cdn-invalidate"
  user = "${aws_iam_user.jsstest.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "cloudfront:CreateInvalidation",
            "Resource": "arn:aws:cloudfront::448878779811:distribution/E2NGU7W2YRZLRS"
        }
    ]
}
EOF
}
