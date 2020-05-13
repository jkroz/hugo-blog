resource "aws_iam_user" "jsstest" {
  name = "jsstest"
}

resource "aws_iam_access_key" "jsstest" {
  user = aws_iam_user.jsstest.name
}

resource "aws_iam_user_policy" "jsstest_ci" {
  name = "${aws_iam_user.jsstest.name}-allow-cdn-invalidate"
  user = aws_iam_user.jsstest.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowCreateInvalidateCDN",
            "Effect": "Allow",
            "Action": "cloudfront:CreateInvalidation",
            "Resource": "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.website_cdn_root.id}"
        }
    ]
}
EOF
}
