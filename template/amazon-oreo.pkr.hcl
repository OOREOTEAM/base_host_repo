packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
    vagrant = {
      version = ">= 1.1.1"
      source = "github.com/hashicorp/vagrant"
    }
  }
}

variable "ami_prefix" {
  type    = string
  default = "ubuntu-minimal-22-04"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "${var.ami_prefix}-${local.timestamp}"
  instance_type = "t3.micro"
  region        = "eu-central-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu-minimal/images/*ubuntu-jammy-22.04-amd64-minimal-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name = "ubuntu-minimal"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "file" {
    source = "vm_keys"
    destination = "/home/ubuntu/vm_keys"
  }

  provisioner "shell" {
  scripts = [
    "scripts/network.sh",
    "scripts/consul.sh",
    "scripts/postgresql.sh",
    "scripts/ssmInstall.sh",
    "scripts/provision.sh",
  ]
  execute_command = "sudo -E bash '{{ .Path }}'"
}

  provisioner "shell" {
    inline = ["echo This provisioner runs last"]
  }

}