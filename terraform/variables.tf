variable "website-domain-main" {
  description = "Main website domain, e.g. you.net"
  type        = string
}

variable "website-domain-redirect" {
  description = "Secondary FQDN that will redirect to the main URL, e.g. www.you.net"
  default     = null
  type        = string
}
