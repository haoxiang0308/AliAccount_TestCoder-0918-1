# Random Terraform resource for a virtual machine

resource "aws_instance" "vm" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI
  instance_type = "t3.micro"

  tags = {
    Name = "RandomVM"
  }
}