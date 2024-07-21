# Mainly hardcoding everything in
resource "aws_instance" "sample_ec2_hardcoded" {
    ami = "ami-0b72821e2f351e396" #OS that runs the ec2
    instance_type = "t2.micro" #EC2 Size types
    key_name = "alan_ce_useast1" #Region specific Keys
    subnet_id = "subnet-037051b755de6deb5" #Public subnet of VPC
    associate_public_ip_address = true 
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    tags = {
      Name = "alanp-webserver-terraform" #EC2 Displayed name
    }
}

#Basically this is taking values from variable
resource "aws_instance" "sample_ec2_var" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = data.aws_subnet.selected_subnet.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    tags = {
      Name = var.ec2_name
    }
}