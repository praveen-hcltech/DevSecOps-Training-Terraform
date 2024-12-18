provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "devsecops_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "devsecops_subnet_pub" {
  vpc_id = aws_vpc.devsecops_vpc.id
  cidr_block = "10.0.1.0/24"
  availablity_zone = "us-east-1"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "devsecops_subnet_pri" {
  vpc_id = aws_vpc.devsecops_vpc.id
  cidr_block = "10.0.2.0/24"
  availablity_zone = "us-east-1"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "devsecops_igw" {
  vpc_id = aws_vpc.devsecops_vpc.id
}

resource "aws_route_table" "devsecops_route_table" {
  vpc_id = aws_vpc.devsecops_vpc.id
}

resource "aws_route" "devsecops_route" {
  route_table_id = aws_route_table.devsecops_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.devsecops_igw.id
}

resource "aws_security_group" "devsecops_sg" {
  vpc_id = aws_vpc.devsecops_vpc.id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "all"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 443
    to_port = 443
    protocol = "tcp"
  }
}

