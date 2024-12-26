terraform {

  backend "s3" {
    bucket = "devsecops-tf-s3"
    key = "networking/terraform.tfstate"
    region =  "us-east-1"
    dynamodb_table = "lock-table"
    encrypt = true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "compute" {
  source = "./compute"
}

module "networking" {
  source = "./networking"
}
