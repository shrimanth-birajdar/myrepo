provider "aws" {
    region = "us-east-1"
}

# # Terraform for S3 Backend
terraform {
    backend "s3" {
    bucket = "terraform-shrimanthbirajdar"
    key    = "my"
    region = "ap-south-1"
    dynamodb_table = "terraform_state_lock"
    }
}

