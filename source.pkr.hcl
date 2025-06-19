locals {
  image_id = var.release != "" ? var.release : formatdate("YYYYMMDDhhmmss", timestamp())
}

packer {  
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  region                  = var.aws_region
  instance_type           = var.instance_type
  ssh_private_key_file    = var.private_key_file
  ami_name                = "${replace("${var.ami_name}-base-${local.image_id}", ".", "-")}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-24.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners      = ["099720109477"]
    most_recent = true
  }

  ssh_username = var.user
  ami_description = "Ubuntu 24.04 com Docker e Zabbix Agent v6"
}
