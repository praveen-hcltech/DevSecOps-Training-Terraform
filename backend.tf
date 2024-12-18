terraform {
  backend "s3" {
    bucket = "devsecops-tf-s3"
    key = "state/terrafrom.tfstate"
    region = "us-east-1"
  }
}
