terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://10.0.1.1:8006/api2/json"
}

module "technitium" {
  source = "../modules/lxc"

  hostname     = "technitium"
  cores        = 2
  memory       = 512
  password     = var.password
  unprivileged = true
}

module "pihole" {
  source = "../modules/lxc"

  hostname     = "pihole"
  cores        = 2
  memory       = 512
  password     = var.password
  unprivileged = true
}

module "samba" {
  source = "../modules/lxc"

  hostname     = "samba"
  cores        = 1
  memory       = 2048
  password     = var.password
  unprivileged = false
}

module "vscode-server" {
  source = "../modules/lxc"

  hostname     = "vscode-server"
  cores        = 4
  memory       = 8192
  password     = var.password
  unprivileged = false
}

module "jellyfin" {
  source = "../modules/lxc"

  hostname     = "jellyfin"
  cores        = 4
  memory       = 2048
  password     = var.password
  unprivileged = false
}

module "postgres" {
  source = "../modules/lxc"

  hostname     = "postgres"
  cores        = 1
  memory       = 1024
  password     = var.password
  unprivileged = true
}

module "redis" {
  source = "../modules/lxc"

  hostname     = "redis"
  cores        = 1
  memory       = 1024
  password     = var.password
  unprivileged = false
}

module "flame" {
  source = "../modules/lxc"

  hostname     = "flame"
  cores        = 1
  memory       = 1024
  password     = var.password
  unprivileged = true
}

module "grafana" {
  source = "../modules/lxc"

  hostname     = "grafana"
  cores        = 1
  memory       = 1024
  password     = var.password
  unprivileged = true
}

# Don't use 10.0.0.208 - set manually for transmission