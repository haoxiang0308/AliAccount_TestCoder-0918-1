# Terraform configuration to create an S3 bucket

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Variable for the S3 bucket name
variable "bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
}

# Variable for the AWS region
variable "aws_region" {
  description = "AWS region to deploy the bucket in"
  type        = string
  default     = "us-west-2"
}

# Resource: S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

# Optional: Enable versioning
resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Optional: Add a bucket policy to block public access
resource "aws_s3_bucket_public_access_block" "my_bucket_pab" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}