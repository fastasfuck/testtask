resource "aws_vpc" "Main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
}

resource "aws_subnet" "publicsubnets" {
  count             = length(var.public_subnets_vpc)
  vpc_id            = aws_vpc.Main.id
  cidr_block        = element(var.public_subnets_vpc, count.index)
  availability_zone = element(var.vpc_azs, count.index)
  depends_on        = [aws_vpc.Main]
}

resource "aws_subnet" "privatesubnets" {
  count             = length(var.privat_subnets_vpc)
  vpc_id            = aws_vpc.Main.id
  cidr_block        = element(var.privat_subnets_vpc, count.index)
  availability_zone = element(var.vpc_azs, count.index)
  depends_on        = [aws_vpc.Main]
}

resource "aws_internet_gateway" "IGW" {
  vpc_id     = aws_vpc.Main.id
  depends_on = [aws_vpc.Main]
}

resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.Main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
}

resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.Main.id
  count  = length(var.public_subnets_vpc)
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.NATgw.*.id, count.index)
  }
}

resource "aws_route_table_association" "PublicRTassociation" {
  count          = length(var.public_subnets_vpc)
  subnet_id      = element(aws_subnet.publicsubnets.*.id, count.index)
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_route_table_association" "PrivateRTassociation" {
  count          = length(var.privat_subnets_vpc)
  subnet_id      = element(aws_subnet.privatesubnets.*.id, count.index)
  route_table_id = element(aws_route_table.PrivateRT.*.id, count.index)
}

resource "aws_eip" "nateIP" {
  count = length(var.public_subnets_vpc)
  vpc   = true
}

resource "aws_nat_gateway" "NATgw" {
  allocation_id = element(aws_eip.nateIP.*.id, count.index)
  count         = length(var.public_subnets_vpc)
  subnet_id     = element(aws_subnet.publicsubnets.*.id, count.index)
}
