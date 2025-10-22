# Terraform configuration for a virtual machine
terraform {
  required_providers {
    # Example provider - this would depend on your cloud provider
    # For AWS, Azure, GCP, etc.
  }
}

# Example VM resource (using AWS as an example)
resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"
  
  tags = {
    Name = "example-vm"
  }
}