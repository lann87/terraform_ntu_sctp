terraform {
    backend "s3" {
        bucket = "sctp-ce7-tfstate"
        key = "terraform-ec2-alan-21jul.tfstate"
        region = "us-east-1"
    }
}