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