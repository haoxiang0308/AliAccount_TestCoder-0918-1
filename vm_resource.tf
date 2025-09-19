resource "aws_instance" "example_vm" {
  # Идентификатор AMI для Amazon Linux 2 в регионе us-east-1
  ami           = "ami-0c0b74d29acd0cd37"
  instance_type = "t3.micro"

  # Теги для идентификации ресурса
  tags = {
    Name = "Example-VM"
    Environment = "Development"
  }

  # Определение группы безопасности
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  # Определение ключевой пары для SSH-доступа
  key_name = "example-key-pair"
}

# Пример группы безопасности, связанной с виртуальной машиной
resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Security group for example VM"

  # Разрешить входящий SSH-трафик
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Разрешить весь исходящий трафик
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-security-group"
  }
}