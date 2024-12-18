provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "DevSecOps_vpc" {
  cidr_block = "10.0.0./16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "DevSecOps_subnet_pub" {
  vpc_id = aws_vpc.DevSecOps_vpc.id
  cidr_block = "10.0.1.0/24"
  availablity_zone = "us-east-1"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "DevSecOps_subnet_pri" {
  vpc_id = aws_vpc.DevSecOps_vpc.id
  cidr_block = "10.0.2.0/24"
  availablity_zone = "us-east-1"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "DevSecOps_igw" {
  vpc_id = aws_vpc.DevSecOps_vpc.id
}

resource "aws_route_table" "DevSecOps_route_table" {
  vpc_id = aws_vpc.DevSecOps_vpc.id
}

resource "aws_route" "DevSecOps_route" {
  route_table_id = aws_route_table.DevSecOps_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.DevSecOps_igw.id
}

resource "aws_security_group" "DevSecOps_sg" {
  vpc_id = aws_vpc.DevSecOps_vpc.id

  egress {
    cidr_blocks = {"0.0.0.0/0"}
    from_port = 0
    to_port = 0
    protocol = "all"
  }

  ingress {
    cidr_blocks = {"0.0.0.0/0"}
    from_port = 80
    to_port = 80
    protocol = "ttp"
  }
}

