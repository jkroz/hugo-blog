output "iam-secret-access-key" {
  description = "IAM Secret Access Key"
  value = aws_iam_access_key.jsstest.encrypted_secret
}

output "website_cdn_root_id" {
  description = "Main CloudFront Distribution ID"
  value       = aws_cloudfront_distribution.website_cdn_root.id
}
