# Terraform configuration for a virtual machine

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Define variables
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
}

# Virtual Machine resource (AWS EC2 Instance)
resource "aws_instance" "vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-vm"
  }
}

# Output the instance ID
output "instance_id" {
  value = aws_instance.vm.id
}

# Output the public IP
output "public_ip" {
  value = aws_instance.vm.public_ip
}