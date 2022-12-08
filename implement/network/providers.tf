provider "aws" {
  default_tags {
    tags = {
      Name      = "Yeghor"
      Terraform = "True"
    }
  }
  region = var.region
}
