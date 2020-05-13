## Providers definition
# Default provider will be inherited from the enclosing configuration

# Setup AWS provider


provider "aws" {
		alias                   = "virginia"
  	version                 = "~> 2.0"
		region                  = "us-east-1"
}

provider "aws" {
		alias                   = "ireland"
  	version                 = "~> 2.0"
		region                  = "eu-west-1"
}
