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
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_debug            = true
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

module "ea" {
  depends_on = [ module.technitium ]
  source = "../modules/lxc"

  hostname     = "ea"
  cores        = 6
  memory       = 8192
  password     = var.password
  unprivileged = true
  storage_size = "100G"
}

module "steam" {
  depends_on = [ module.technitium ]
  source = "../modules/lxc"

  hostname     = "steam"
  cores        = 4
  memory       = 8192
  password     = var.password
  unprivileged = false
  storage_size = "50G"
}

module "test" {
  depends_on = [ module.technitium ]
  source = "../modules/lxc"

  hostname     = "test3"
  cores        = 1
  memory       = 2048
  password     = var.password
  unprivileged = false
  storage_size = "8G"
}