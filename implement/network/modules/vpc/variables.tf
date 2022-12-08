variable "vpc_name" {
}
variable "vpc_cidr" {
  type = string
}
variable "privat_subnets_vpc" {
  type = list(string)
}
variable "public_subnets_vpc" {
  type = list(string)
}
variable "vpc_azs" {
  type = list(string)
}
