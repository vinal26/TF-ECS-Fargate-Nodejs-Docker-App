resource "aws_s3_bucket" "bucket" {
  bucket = "test-nodejs-terraform-state-backend"
  
  tags = {
    Name = "S3 Remote Terraform State Store"
  }
  object_lock_enabled = true
}

resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_object_lock_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 3
    }
  }
}