output "IAM_AK" {
  description = "IAM Access Key"
  value				= aws_iam_access_key.jsstest.id
}

output "IAM_SK" {
  description = "IAM Secret Access Key"
  value				= aws_iam_access_key.jsstest.secret
}

output "OAI_ROOT" {
	description = "OAI ROOT CDN"
	value = aws_cloudfront_origin_access_identity.origin_access_identity_website.id
}

output "CDN_ROOT_ID" {
  description = "Main CloudFront Distribution ID"
  value       = aws_cloudfront_distribution.website_cdn_root.id
}

output "CDN_ROOT_DOMAIN_ID" {
  description = "Main CloudFront Domain ID"
  value       = aws_cloudfront_distribution.website_cdn_root.domain_name
}
