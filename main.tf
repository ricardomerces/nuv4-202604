terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}


# Busca a AMI mais recente do Ubuntu 26.04 LTS
data "aws_ami" "ubuntu_26" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-*-26.04-amd64-server-*"]
  }
}

# Security Group
resource "aws_security_group" "allow_ssh" {
  name        = "ssh"
  description = "Permitir acesso SSH"

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

# Instância EC2
resource "aws_instance" "servidor_aula8" {
  ami                    = data.aws_ami.ubuntu_26.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "EC2-Ubuntu26-Aula8"
  }
}

# Bucket S3
resource "aws_s3_bucket" "bucket_aula8" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}