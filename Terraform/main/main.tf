terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
  pm_api_url          = "https://10.0.10.2:8006/api2/json"
  pm_tls_insecure     = true
  pm_user     = var.PM_USER
  pm_password = var.PM_PASS
  # pm_debug            = true
}

module "technitium" {
  source = "../modules/lxc"

  hostname     = "dns"
  cores        = 2
  memory       = 2048
  password     = var.password
  unprivileged = false
  storage_size = "8G"
  ipv4         = "10.0.11.2/24"
  gateway      = "10.0.11.1"
}

module "video" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "video"
  cores        = 6
  memory       = 8192
  password     = var.password
  storage_size = "100G"
}

module "games" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "games"
  cores        = 8
  memory       = 8192
  password     = var.password
  unprivileged = false
  storage_size = "300G"
  # Nesting might need to be enabled manually post deployment
}

module "game" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "game"
  cores        = 8
  memory       = 8192
  password     = var.password
  unprivileged = false
  storage_size = "300G"
  nesting = true
}

module "download" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "download"
  cores        = 2
  memory       = 2048
  password     = var.password
  storage_size = "100G"
}

module "monitor" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "monitor"
  cores        = 4
  memory       = 4090
  password     = var.password
  storage_size = "25G"
}

module "db" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "db"
  cores        = 2
  memory       = 4096
  password     = var.password
  storage_size = "25G"
}

module "storage" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "storage"
  cores        = 1
  memory       = 2048
  password     = var.password
  storage_size = "8G"
}

module "pod" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "pod"
  cores        = 10
  memory       = 24576
  password     = var.password
  storage_size = "200G"
  unprivileged = false
  nesting      = true
}

module "paperless" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "paperless"
  cores        = 2
  memory       = 2048
  password     = var.password
  storage_size = "16G"
  unprivileged = false
  nesting      = true
}

module "code" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "code"
  cores        = 8
  memory       = 16384
  password     = var.password
  storage_size = "100G"
}

module "auth" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "auth"
  cores        = 2
  memory       = 2048
  password     = var.password
  storage_size = "16G"
}