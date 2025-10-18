# Terraform configuration for a virtual machine

terraform {
  required_providers {
    # Example provider - this would need to be configured based on your cloud provider
    # For example, aws, azurerm, google, etc.
  }
}

# Virtual Machine resource
resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "example-vm"
  }

  # Optional: specify key pair for SSH access
  # key_name = "your-key-pair"

  # Optional: configure security group
  # vpc_security_group_ids = ["sg-12345678"]

  # Optional: add storage
  # root_block_device {
  #   volume_size = 20
  #   volume_type = "gp2"
  # }
}

# Output the public IP of the VM
output "vm_public_ip" {
  value = aws_instance.example_vm.public_ip
}