resource "aws_route53_zone" "recrd" {
  name = "recrd.com"
}

module "certificate" {
  source = "./modules/certificate"

  name    = "recrd.com"
  zone_id = aws_route53_zone.recrd.zone_id
}
