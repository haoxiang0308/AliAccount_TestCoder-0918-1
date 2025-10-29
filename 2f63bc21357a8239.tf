# Terraform configuration to create an AWS S3 bucket

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

variable "aws_region" {
  description = "AWS region where the bucket will be created"
  type        = string
  default     = "us-east-1"
}

# Create the S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Output the bucket name and ARN
output "bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.my_bucket.id
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = aws_s3_bucket.my_bucket.arn
}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.bucket_domain_name
}