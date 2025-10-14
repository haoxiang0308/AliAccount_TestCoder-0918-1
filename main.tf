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

# Define the S3 bucket resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}

# Define variables
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}