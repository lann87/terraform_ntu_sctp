terraform {
  required_providers {
    aww = {
        source  = "hashcorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}