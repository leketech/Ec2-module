output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.strong.id
}
output "subnet_id" {
  description = "ID of the created subnet"
  value       = aws_subnet.wild.id
}

output "security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.mvp-sg.id
}

output "instance_details" {
  description = "Details of the created EC2 instance"
  value       = module.insta-one
}