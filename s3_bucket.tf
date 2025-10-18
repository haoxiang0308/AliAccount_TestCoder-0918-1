terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-tf-test-bucket-12345"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "MyExampleBucket"
    Environment = "Dev"
  }
}

output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.example_bucket.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.example_bucket.arn
}