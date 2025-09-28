/*
* This file was generated on Sunday, September 28, 2025
*/

# Terraform configuration for a virtual machine

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI ID for us-east-1
  instance_type = "t3.micro"

  tags = {
    Name = "WebServerInstance"
  }
}