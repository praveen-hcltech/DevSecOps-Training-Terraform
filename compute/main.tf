resource "aws_instance" "devsecops_ec2_tf" {

  ami = "ami-0d6560f3176dc9ec0"
  instance_type = "t2.micro"
  
}
