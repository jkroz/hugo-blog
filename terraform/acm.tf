
## ACM (AWS Certificate Manager)
# Creates the wildcard certificate *.<yourdomain.com>
#resource "aws_acm_certificate" "wildcard_website" {
#  provider = aws.us-east-1 # Wilcard certificate used by CloudFront requires this specific region (https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cnames-and-https-requirements.html)
#
#  domain_name               = var.website-domain-main
#  subject_alternative_names = ["*.${var.website-domain-main}"]
#  validation_method         = "DNS"
#
#  tags = {
#    ManagedBy = "terraform"
#    Changed   = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
#  }
#
#  lifecycle {
#    ignore_changes = [tags]
#  }
#}

# Validates the ACM wildcard by creating a Route53 record (as `validation_method` is set to `DNS` in the aws_acm_certificate resource)
#resource "aws_route53_record" "wildcard_validation" {
#  name    = aws_acm_certificate.wildcard_website.domain_validation_options[0].resource_record_name
#  type    = aws_acm_certificate.wildcard_website.domain_validation_options[0].resource_record_type
#  zone_id = data.aws_route53_zone.main.zone_id
#  records = [aws_acm_certificate.wildcard_website.domain_validation_options[0].resource_record_value]
#  ttl     = "60"
#}
#
## Triggers the ACM wildcard certificate validation event
#resource "aws_acm_certificate_validation" "wildcard_cert" {
#  provider = aws.us-east-1
#
#  certificate_arn         = aws_acm_certificate.wildcard_website.arn
#  validation_record_fqdns = [aws_route53_record.wildcard_validation.fqdn]
#}
#
#
## Get the ARN of the issued certificate
#data "aws_acm_certificate" "wildcard_website" {
#  provider = aws.us-east-1
#
#  depends_on = [
#    aws_acm_certificate.wildcard_website,
#    aws_route53_record.wildcard_validation,
#    aws_acm_certificate_validation.wildcard_cert,
#  ]
#
#  domain      = var.website-domain-main
#  statuses    = ["ISSUED"]
#  most_recent = true
#}
