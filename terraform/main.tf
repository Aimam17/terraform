# Specify the provider
provider "aws" {
  region = var.aws_region
}

# Configure the backend to use S3 for storing Terraform state
terraform {
  backend "s3" {
    bucket         = var.s3_bucket_name
    key            = "terraform/state/terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = var.dynamodb_table_name # optional for state locking
    encrypt        = true
  }
}

# Security Group to allow SSH access
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "Terraform-EC2"
  }
}
