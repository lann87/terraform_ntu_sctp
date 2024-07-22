variable "ami_id" {
  description = "AMI ID"
  type = string
  default = "ami-0b72821e2f35e396"
}

variable "ec2_name" {
  description = "Name of EC2"
  type = string
  default = "alanp-ec2-date-tf"
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
  default = "alanp-ec2-securitygroup"
}

variable "vpc_name" {
  description = "Name of VPC to use"
  type = string
  default = "alan-vpc"
}

variable "subnet_name" {
  description = "Name of subnet to use"
  type = string
  default = "alanp-subnet-public-useast1a"
}