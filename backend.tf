terraform {
  backend "s3" {
    bucket = "DevSecOps_s3"
    key = "state/terrafrom.tfstate"
    region = "us-east-1"
  }
}
