resource "aws_vpc" "devsecops_vpc_tf" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "devsecops_subnet_pub" {
  vpc_id = aws_vpc.devsecops_vpc_tf.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "devsecops_subnet_pri" {
  vpc_id = aws_vpc.devsecops_vpc_tf.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_internet_gateway" "devsecops_internet_gw" {
  vpc_id = aws_vpc.devsecops.id
}

resource "aws_route_table" "devsecops_route_table_pub" {

  vpc_id = aws_vpc.devsecops_vpc_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devsecops_internet_gw.id
  }
}

resource "aws_route_table" "devsecops_route_table_pri" {

  vpc_id = aws_vpc.devsecops_vpc_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devsecops_internet_gw.id
  }
}

resource "aws_route_table_association" "devsecops_subnet_pub_association" {
  subnet_id = aws_subnet.devsecops_subnet_pub.id
  route_table_id = aws_route_table.devsecops_route_table_pub.id
}

resource "aws_route_table_association" "devsecops_subnet_pri_association" {
  subnet_id = aws_subnet.devsecops_subnet_pri.id
  route_table_id = aws_route_table.devsecops_route_table_pri.id
}
