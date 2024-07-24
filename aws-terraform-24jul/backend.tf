terraform {
  backend "s3" {
    bucket = "alan-jul24-tfstate"
    key = "terraform-ec2-alan-21jul.tfstate"
    region = "us-east-1"
  }
}