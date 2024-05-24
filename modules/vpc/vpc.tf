resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-${var.vpc_name}"
  }
}

resource "aws_security_group" "eks" {
  name        = "${var.env}-${var.vpc_name}-vpc-sg"
  description = "Security group for the VPC used by the ${var.env} service"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.60.0.0/16"]
  }

  // You might want to define egress rules as well
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-vpc-sg"
    Service = "security-group"
    env = "${var.env}"
  }
}