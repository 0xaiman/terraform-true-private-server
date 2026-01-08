# AWS region
variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

# AWS VPC CIDR
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# AWS Subnet CIDR
variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

# AWS Instance Type
variable "instance_type" {
  type    = string
  default = "t3.micro"
}

# AWS AMI
variable "ami_id" {
  type    = string
  default = "ami-00d8fc944fb171e29"
}

