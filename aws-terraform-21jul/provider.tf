terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"    
        version = "~> 5.0"          #~> takes everything within version 5.0 branch
      }
    }
}

provider "aws" {
  #region = "us-east-1"         # Update as required
  #access_key = "xxx"           # Update as required
  #secret_key = "xxx"           # Update as required
}