terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
    }
  }
}

provider "random" {}

resource "random_password" "password" {
  length           = 16
  special          = true
  upper            = true
  lower            = true
  numeric           = true
  override_special = "!@#$%&*()_+-=[]{}<>?"
}

resource "linode_instance" "my-instance" {
    label = "vps"
    region = "us-east"
    type = "g6-nanode-1"
}

resource "linode_instance_config" "my-config" {
  linode_id = linode_instance.my-instance.id
  label = "my-config"
  virt_mode = "fullvirt"

  interface {
    purpose = "public"
  }  

  device {
    device_name = "sda"
    disk_id = linode_instance_disk.boot.id
  }

  helpers {
    network = false
  }

  booted = true
}

resource "linode_instance_disk" "boot" {
  label = "boot"
  linode_id = linode_instance.my-instance.id
  size = linode_instance.my-instance.specs.0.disk

  image = "linode/debian12"
  root_pass = random_password.password.result
  authorized_keys = [var.PUBLIC_KEY]
}
