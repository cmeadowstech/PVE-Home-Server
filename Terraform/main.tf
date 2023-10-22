terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://10.0.0.100:8006/api2/json"
}

module "pihole" {
  source = "./modules/lxc"

  hostname     = "pihole"
  cores        = 2
  memory       = 512
  ip           = "10.0.0.201/24"
  password     = var.password
  unprivileged = true
}

module "samba" {
  source = "./modules/lxc"

  hostname     = "samba"
  cores        = 1
  memory       = 2048
  ip           = "10.0.0.202/24"
  password     = var.password
  unprivileged = false
}