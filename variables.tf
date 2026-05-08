variable "region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-2"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Nome da chave .pem já existente na AWS"
  type        = string
  default     = "aula8"
}

variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
  default     = "nuv4-aula8"
}

variable "volume_size" {
  description = "Tamanho do disco em GB"
  type        = number
  default     = 8
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true # Evita que o valor apareça nos logs do terminal
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}
