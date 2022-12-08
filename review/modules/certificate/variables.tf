variable "name" {
  description = "Certificate domain name"
  type        = string
}

variable "zone_id" {
  description = "Hosted zone ID for certificate validation"
  type        = string
}
