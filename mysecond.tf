terraform {
  backend "s3" {
    bucket = "shrimanthbirajdar-b60"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "example" {
  bucket = "shrimanthbirajdar-b60"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_instance" "myinstance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  tags                   = var.tags
  vpc_security_group_ids = var.vpc_security_group_ids
}

variable "region" {
  description = "Please enter AWS region"
  default     = "us-east-1"
}

variable "key_name" {
  default = "terraformkey"
}

variable "tags" {
  type = map(string)
  default = {
    env  = "dev"
    Name = "instance1"
  }
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = ["sg-095d16c928a4862ed"]
}

variable "ami" {
  default = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
  default = "t2.micro"
}