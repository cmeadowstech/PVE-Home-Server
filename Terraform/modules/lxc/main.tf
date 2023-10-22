terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

resource "proxmox_lxc" "lxc" {
  target_node  = "cmeadows"
  hostname     = var.hostname
  ostemplate   = "local:vztmpl/debian-12-standard_12.0-1_amd64.tar.zst"
  ostype       = "debian"
  cores = var.cores
  memory = var.memory
  password     = var.password
  unprivileged = var.unprivileged
  onboot = true
  start = true

  ssh_public_keys = file(var.ssh_keys["pub"])

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = var.ip
    gw = "10.0.0.1"
  }
}