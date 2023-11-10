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
  source = "../modules/lxc"

  hostname     = "pihole"
  cores        = 2
  memory       = 512
  ip           = "10.0.0.201/32"
  password     = var.password
  unprivileged = true
}

module "samba" {
  source = "../modules/lxc"

  hostname     = "samba"
  cores        = 1
  memory       = 2048
  ip           = "10.0.0.202/32"
  password     = var.password
  unprivileged = false
}

module "vscode-server" {
  source = "../modules/lxc"

  hostname     = "vscode-server"
  cores        = 4
  memory       = 8192
  ip           = "10.0.0.203/32"
  password     = var.password
  unprivileged = false
}

module "jellyfin" {
  source = "../modules/lxc"

  hostname     = "jellyfin"
  cores        = 4
  memory       = 2048
  ip           = "10.0.0.204/32"
  password     = var.password
  unprivileged = false
}

module "postgres" {
  source = "../modules/lxc"

  hostname     = "postgres"
  cores        = 1
  memory       = 1024
  ip           = "10.0.0.205/32"
  password     = var.password
  unprivileged = true
}