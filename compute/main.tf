resource "aws_instance" "devsecops_ec2_tf" {

  ami = "ami-003f5a76758516d1e"
  instance_type = "t2.micro"
  
}
