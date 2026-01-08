# All resources live here initially

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# 1) Create a VPC
resource "aws_vpc" "vpc_saya" {

  cidr_block = var.vpc_cidr
  tags = {
    Name = "VPC Saya"
  }
}

# 2) Create a Subnet
# Why:
# i) AWS requires every EC2 instance to live in a subnet.
# ii) Even for a private VM, this is mandatory.
resource "aws_subnet" "subnet_saya" {
  vpc_id     = aws_vpc.vpc_saya.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "Subnet Saya"
  }
}

# 3) Create Security Group
# Why:
#  i) EC2 needs a firewall even if it’s private.
#  ii)For a private VM, we typically allow only internal access (e.g., SSH from inside VPC).
resource "aws_security_group" "security_group_saya" {
  vpc_id = aws_vpc.vpc_saya.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Only inside VPC
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Security Group Saya"
  }
}

# 4) Create EC2
# Why:
# i) This is the VM itself.
# ii)Must be in the subnet and reference the SG.
# iii) For a “true private server”, no public IP.
resource "aws_instance" "instance_saya" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_saya.id
  vpc_security_group_ids      = [aws_security_group.security_group_saya.id]
  associate_public_ip_address = false

  tags = {
    Name = "Instance Saya"
  }
}
