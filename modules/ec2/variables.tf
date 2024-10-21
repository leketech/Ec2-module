variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "trf"
}
variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}
variable "availability_zone" {
  description = "Availability Zone for the instance"
  type        = string
  default     = "us-west-2a"
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}