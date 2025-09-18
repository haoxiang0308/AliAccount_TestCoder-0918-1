# Terraform configuration for creating an AWS S3 bucket

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345" # Change this to your desired bucket name

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Development"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}