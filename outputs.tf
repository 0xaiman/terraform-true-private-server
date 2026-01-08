output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc_saya.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = aws_subnet.subnet_saya.id
}

output "security_group_id" {
  description = "The ID of the SG"
  value       = aws_security_group.security_group_saya.id
}

output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.instance_saya.id
}

output "instance_private_ip" {
  description = "The IP of the instance"
  value       = aws_instance.instance_saya.private_ip
}


