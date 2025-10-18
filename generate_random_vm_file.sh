#!/bin/bash

# Generate a random filename with .tf extension
random_filename=$(openssl rand -hex 8).tf

# Create the Terraform configuration for a virtual machine
cat > "/workspace/$random_filename" << 'EOF'
# Terraform configuration for a virtual machine
resource "null_resource" "virtual_machine" {
  # This is a placeholder - in a real scenario you would use actual cloud resources
  # such as aws_instance, azurerm_virtual_machine, google_compute_instance, etc.
  triggers = {
    name = "my-vm-instance"
  }
  
  # Example of common VM configuration elements
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.triggers.name
  }
  
  provisioner "remote-exec" {
    inline = [
      "echo 'Virtual machine setup started'",
      "apt-get update",
      "apt-get install -y nginx"
    ]
  }
}

# Output the VM details
output "vm_id" {
  value = null_resource.virtual_machine.id
}

output "vm_name" {
  value = "my-vm-instance"
}
EOF

echo "Created Terraform VM resource file: $random_filename"