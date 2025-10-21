# Terraform configuration for a virtual machine

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Define the AWS provider
provider "aws" {
  region = var.aws_region
}

# Create a virtual machine (EC2 instance)
resource "aws_instance" "example_vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.vm_name
  }
}

# Define variables
variable "aws_region" {
  description = "AWS region for the VM"
  type        = string
  default     = "us-west-2"
}

variable "ami_id" {
  description = "ID of the AMI to use for the VM"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "vm_name" {
  description = "Name tag for the VM"
  type        = string
  default     = "example-vm"
}

# Output the instance ID and public IP
output "instance_id" {
  description = "ID of the created instance"
  value       = aws_instance.example_vm.id
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.example_vm.public_ip
}