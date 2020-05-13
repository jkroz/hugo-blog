## Providers definition
# Default provider will be inherited from the enclosing configuration

# The provider below is required to handle ACM and Lambda in a CloudFront context
provider "aws" {
  alias                   = "eu-west-1"
  version                 = "~> 2.0"
  region                  = "eu-west-1"
  profile									= "ippon-sandbox-01"
}
