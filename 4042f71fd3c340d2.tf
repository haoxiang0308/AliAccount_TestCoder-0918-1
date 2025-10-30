# Declaração de variáveis para entrada de usuário em Terraform

variable "instance_name" {
  description = "Nome da instância"
  type        = string
  default     = "minha-instancia"
}

variable "instance_type" {
  description = "Tipo da instância"
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "Nome da chave SSH"
  type        = string
  sensitive   = true
}