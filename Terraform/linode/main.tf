terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      # version = "..."
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

resource "linode_instance" "terraform-web" {
    image = "linode/debian12"
    label = "vps"
    region = "us-east"
    type = "g6-nanode-1"
    authorized_keys = [var.PUBLIC_KEY]
    root_pass = random_password.password.result
}
