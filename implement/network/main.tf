module "vpc" {
  source             = "./modules/vpc"
  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  privat_subnets_vpc = var.privat_subnets_vpc
  public_subnets_vpc = var.public_subnets_vpc
  vpc_azs            = var.vpc_azs
}
