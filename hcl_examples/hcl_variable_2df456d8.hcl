variable "example_instance_type" {
  type        = string
  description = "The instance type for the virtual machine"
  default     = "t3.micro"
  
  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.example_instance_type)
    error_message = "Instance type must be one of t3.micro, t3.small, or t3.medium."
  }
}