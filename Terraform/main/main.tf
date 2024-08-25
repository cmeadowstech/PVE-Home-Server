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

module "technitium" {
  source = "../modules/lxc"

  hostname     = "technitium"
  cores        = 2
  memory       = 512
  ip           = "10.0.0.234/32"
  password     = var.password
  unprivileged = true
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

module "redis" {
  source = "../modules/lxc"

  hostname     = "redis"
  cores        = 1
  memory       = 1024
  ip           = "10.0.0.206/32"
  password     = var.password
  unprivileged = false
}

module "flame" {
  source = "../modules/lxc"

  hostname     = "flame"
  cores        = 1
  memory       = 1024
  ip           = "10.0.0.210/32"
  password     = var.password
  unprivileged = true
}

module "grafana" {
  source = "../modules/lxc"

  hostname     = "grafana"
  cores        = 1
  memory       = 1024
  ip           = "10.0.0.207/32"
  password     = var.password
  unprivileged = true
}

# Don't use 10.0.0.208 - set manually for transmission