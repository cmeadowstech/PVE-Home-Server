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

module "ea" {
  source = "../modules/lxc"

  hostname     = "ea"
  cores        = 6
  memory       = 8192
  password     = var.password
  unprivileged = true
  storage_size = "100G"
}