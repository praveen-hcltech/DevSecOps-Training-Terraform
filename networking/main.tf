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
