variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_name" {
  type    = string
  default = "docker-zabbix6"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "user" {
  type        = string
  description = "Usuário default"
  default     = "ubuntu"
}

variable "key_pair_name" {
  description = "Nome da chave SSH para acesso à instância"
  type        = string
  default     = "ansible-key"
}

variable "private_key_file" {
  description = "Caminho para a chave privada usada para SSH"
  type        = string
  default     = "ansible-key.pem"
}

variable "release" {
  description = "Tag ou timestamp de release para nomear a AMI"
  type        = string
  default     = ""
}