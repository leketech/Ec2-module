data "aws_ami" "insta" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# First, get all available subnets in the VPC
data "aws_subnets" "available" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "availability-zone"
    values = [var.availability_zone]
  }
}

# Then use the first available subnet
resource "aws_instance" "insta" {
  ami                    = data.aws_ami.insta.id
  key_name              = var.key_name
  instance_type         = var.instance_type
  subnet_id             = var.subnet_id != "" ? var.subnet_id : tolist(data.aws_subnets.available.ids)[0]
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "insta-one"
  }
}