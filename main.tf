resource "aws_vpc" "strong" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "strong-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "wild" {
  vpc_id     = aws_vpc.strong.id
  cidr_block = var.subnet_cidr

  tags = {
    Name        = "wild-subnet"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "lifeline" {
  vpc_id = aws_vpc.strong.id

  tags = {
    Name        = "lifeline"
    Environment = var.environment
  }
}

resource "aws_security_group" "mvp-sg" {
  name   = "mvp-sg"
  vpc_id = aws_vpc.strong.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "allow_tls"
    Environment = var.environment
  }
}

module "insta-one" {
  source             = "./modules/ec2"
  key_name           = var.key_name
  subnet_id          = aws_subnet.wild.id
  security_group_ids = [aws_security_group.mvp-sg.id]
  vpc_id             = var.vpc_id
  availability_zone = var.availability_zone
}