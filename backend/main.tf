resource "aws_s3_bucket" "terraform_state" {
  bucket = "devsecops-tf-s3"
  acl = "private"

  versioning {
    enable = true
  }
}

# DynamoDB Table for state locking

resource "aws_dynamo_table" "tf_lock" {
  name = "tf-table"
  billing_mode = "PROVISIONED"
  read_capacity = 20
  write_capacity = 20
  hash_key = "UserId"
  range_key = "Training-TF"

  attribute {
    name = "UserId"
    type = "S"
  }
}
