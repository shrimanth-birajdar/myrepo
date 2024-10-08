provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "myinstance" {
  ami = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name = "terrfromkey"
  tags = {
    env = "dev"
    Name = "instance1"
  }
  vpc_security_group_ids = ["sg-095d16c928a4862ed"]
}