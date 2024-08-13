terraform {
    backend "s3" {
        bucket = "sctp-ce7-tfstate"
        key = "terraform-ec2-alan-21jul.tfstate"
        region = "us-east-1"
    }
}

# Mainly hardcoding everything in
resource "aws_instance" "sample_ec2_hardcoded" {
    ami = "ami-0b72821e2f351e396" #Amazon Machine Image ID to launch instance
    instance_type = "t2.micro" #Type of instances by performance/size
    key_name = "alan_ce_useast1" #SSH Region specific Keys
    subnet_id = "subnet-037051b755de6deb5" #Public subnet of VPC
    associate_public_ip_address = true #True = assign a public IP 
    vpc_security_group_ids = [aws_security_group.ec2_sg.id] #List of security group to apply

    tags = {
      Name = "alanp-webserver-terraform" #EC2 Displayed name
    }
}

#Basically this is taking values from variable
resource "aws_instance" "sample_ec2_var" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = data.aws_subnet.alan_pubsubnet_1a.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    tags = {
      Name = var.ec2_name
    }
}

resource "aws_security_group" "ec2_sg" {
    name = var.sg_name
    vpc_id = data.aws_vpc.alanvpc_20jul.id # var.vpc_id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    # This is outbound security rule for security group
    egress {
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks         =["0.0.0.0/0"]
        ipv6_cidr_blocks    = ["::/0"]
    }
}

data "aws_vpc" "alanvpc_20jul" {
    filter {
        name = "tag:Name"
        values = [var.vpc_name]
    }
}

data "aws_subnet" "alan_pubsubnet_1a" {
    filter {
        name = "tag:Name"
        values = [var.subnet_name]
    }
}

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

variable "ami_id" {
  description = "AMI ID"
  type = string
  default = "ami-0b72821e2f35e396"
}

variable "ec2_name" {
  description = "Name of EC2"
  type = string
  default = "alanp-ec2-date-tf-var"
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of EC2 Key Pair"
  type = string
  default = "alan_ce_useast1" # ssh keypair that has .pem extension
}

variable "sg_name" {
  description = "Name of EC2 Security Group"
  type = string
  default = "alan_ec2_20jul_securitygroup1"
}

variable "vpc_name" {
  description = "Name of VPC to use"
  type = string
  default = "alanvpc_20jul"
}

variable "subnet_name" {
  description = "Name of subnet to use"
  type = string
  default = "alan_pubsubnet_1a"
}
