packer {
  required_plugins {
    amazon = {
      version = ">= 1.3.3"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "aws_region" {
  default = "us-east-1"
}

variable "ami_name" {
  default = "mongodb-ami"
}

variable "instance_type" {
  default = "t2.micro"
}

# Definir la variable "ami_id" con el valor de la AMI de Ubuntu 24.04 free tier
variable "ami_id" {
  default = "ami-0866a3c8686eaeeba"
}

# Configurar el builder para crear la AMI en AWS
source "amazon-ebs" "mongodb_ami" {
  region                      = var.aws_region
  instance_type               = var.instance_type
  source_ami                  = var.ami_id
  ssh_username                = "ubuntu"
  ami_name                    = var.ami_name
  associate_public_ip_address = true
}

# Provisioners para instalar y configurar MongoDB
build {
  sources = ["source.amazon-ebs.mongodb_ami"]

  provisioner "shell" {
    script = "scripts/install.sh"
  }

  provisioner "shell" {
    script = "scripts/configure.sh"
  }

  provisioner "shell" {
    script = "scripts/start.sh"
  }
}
