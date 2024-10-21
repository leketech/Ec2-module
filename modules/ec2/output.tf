output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.insta.id
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.insta.private_ip
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.insta.public_ip
}