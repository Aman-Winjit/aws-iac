terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.20.0"
    }
  }
}

# Connect AWS CLI 
provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}