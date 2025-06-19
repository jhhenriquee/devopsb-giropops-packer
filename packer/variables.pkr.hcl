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
