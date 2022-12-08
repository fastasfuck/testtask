variable "region" {
  default = "us-west-1"
}

#VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "privat_subnets_vpc" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
variable "public_subnets_vpc" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
variable "vpc_azs" {
  default = ["eu-west-1a", "eu-west-1c"]
}
variable "vpc_name" {
  default = "test"
}
