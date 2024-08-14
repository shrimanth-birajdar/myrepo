terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

##### Try to create one ubuntu server
resource "aws_instance" "this" {
  ami                     = "ami-04a81a99f5ec58529"
  instance_type           = "t2.micro"
  key_name                = ""
  tags = var.tags

}

