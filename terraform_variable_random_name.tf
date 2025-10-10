# Переменная в HCL с типом строка, сохраненная в файл со случайным именем

variable "my_string_variable" {
  type        = string
  description = "Пример переменной типа строка"
  default     = "Это строка по умолчанию"
}