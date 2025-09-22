resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345" # Should be globally unique

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}

# Block public access by default
resource "aws_s3_bucket_public_access_block" "my_bucket_block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}