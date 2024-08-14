resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-shrimanthbirajdar"
}

resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = aws_s3_bucket.terraform-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# State locking using dynamodb
resource "aws_dynamodb_table" "state_lock_table" {
  name           = "terraform_state_lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}


# resource block for server creation
resource "aws_instance" "server_1" {
    ami ="ami-0583d8c7a9c35822c"
    instance_type = var.instance_type
    key_name = var.key_name
    tags = var.tags
}




