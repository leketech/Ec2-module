variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "trf"
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
  default     = "dev"
}
variable "availability_zone" {
  description = "Availability Zone for the instance"
  type        = string
  default     = "us-west-2a"
}
variable "instance_type" {
  type = string
  default = "t3.medium"
}
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
  # Remove the default value that was trying to reference a resource
}