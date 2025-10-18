# Generate a random name for our VM resource file
resource "random_id" "vm_name_suffix" {
  byte_length = 4
}

# Create a virtual machine resource (using null_resource as a placeholder example)
# In a real scenario, this would be a specific cloud provider resource
resource "null_resource" "virtual_machine" {
  # This is a placeholder - in a real scenario you would use actual cloud resources
  # such as aws_instance, azurerm_virtual_machine, google_compute_instance, etc.
  triggers = {
    name = "vm-${random_id.vm_name_suffix.hex}"
  }
}

# Output the random name that was generated
output "vm_name" {
  value = "vm-${random_id.vm_name_suffix.hex}"
}