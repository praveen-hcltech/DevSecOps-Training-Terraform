resource "aws_s3_bucket" "terraform_state" {
  bucket = "devsecops-tf-s3"
  acl = "private"

  versioning {
    enabled = true
  }
}

# DynamoDB Table for state locking

resource "aws_dynamo_table" "tf_lock" {
  name = "tf-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
