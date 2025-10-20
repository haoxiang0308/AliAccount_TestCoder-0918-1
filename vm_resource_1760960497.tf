# Terraform configuration for a virtual machine

resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  
  tags = {
    Name = "example-vm"
  }
}

# Optional: Define variables for flexibility
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0c55b159cbfafe1d0"
}