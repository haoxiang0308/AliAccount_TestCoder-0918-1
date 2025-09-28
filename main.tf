provider "aws" {
  region = "us-west-2" # You can change this to your preferred region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-terraform-bucket-12345" # Replace with a globally unique name

  tags = {
    Name        = "MyTerraformBucket"
    Environment = "Dev"
  }
}