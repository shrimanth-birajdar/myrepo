terraform {
  backend "s3" {
    bucket = "shrimanthbirajdar-b70"
    region = "us-east-1"
    key = "terraform.tfstate"
  }
}
provider "aws" {
   
}
data "aws_security_group" "my.sg" {
    filter {
      name = "vpc-id"
      values = ["vpc-0d039bd3719fb09a4"]
 }
 filter {
   name = "group-name"
   values = ["default"]
 }
  
}
resource "aws_instance" "myinstance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  tags                   = var.tags
  vpc_security_group_ids = ["vpc-0d039bd3719fb09a4"]
}

variable "region" {
  description = "Please enter AWS region"
  default     = "us-east-1"
}

variable "key_name" {
  default = "pj"
}

variable "tags" {
  type = map(string)
  default = {
    env  = "dev"
    Name = "instance1"
  }
}


variable "ami" {
  default = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
  default = "t2.micro"
}


