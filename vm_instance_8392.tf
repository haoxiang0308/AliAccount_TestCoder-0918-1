# Terraform configuration for a virtual machine

terraform {
  required_providers {
    # Example provider - in real usage you would specify your cloud provider
    # like aws, azure, google, etc.
  }
}

# Virtual Machine resource
resource "null_resource" "vm_example" {
  # This is a placeholder resource since we don't have a specific cloud provider configured
  # In a real scenario, this would be something like:
  # resource "aws_instance" "web_server" {
  #   ami           = "ami-0c55b159cbfafe1d0"
  #   instance_type = "t2.micro"
  # }
  
  triggers = {
    # This ensures the resource is recreated only when these values change
    vm_config = "${timestamp()}"
  }
  
  # Provisioning scripts would go here
  connection {
    # Connection details for provisioning
  }
  
  provisioner "remote-exec" {
    inline = [
      "echo 'Virtual machine provisioned successfully'"
    ]
  }
}

# Output the virtual machine details
output "vm_id" {
  value = null_resource.vm_example.id
  description = "The ID of the virtual machine"
}

output "vm_status" {
  value = "VM example created successfully"
  description = "Status of the virtual machine"
}