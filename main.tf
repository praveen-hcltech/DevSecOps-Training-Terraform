terraform {
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

provider "compute" {
  source = "./compute"
}

provider "networking" {
  source = "./networking"
}
