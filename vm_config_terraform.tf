# Terraform configuration for a virtual machine

terraform {
  required_providers {
    # This example uses the 'null' provider for a simple demonstration.
    # In a real scenario, you would use a cloud provider like 'aws', 'google', or 'azurerm'.
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

# Data source to get information, if needed (example: current timestamp)
data "null_data_source" "date" {
  inputs = {
    creation_time = timestamp()
  }
}

# Resource: A virtual machine instance (using null_resource as a placeholder)
resource "null_resource" "vm_instance" {
  triggers = {
    # This ensures the resource is recreated if the creation_time changes
    creation_time = data.null_data_source.date.outputs.creation_time
  }

  # Example of a provisioner that runs locally after creation
  provisioner "local-exec" {
    command = "echo 'Virtual machine ${self.id} is provisioned at ${data.null_data_source.date.outputs.creation_time}' > vm_provision.log"
  }
}

# Output the ID of the created resource
output "virtual_machine_id" {
  value = null_resource.vm_instance.id
}