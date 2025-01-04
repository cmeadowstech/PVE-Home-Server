terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

resource "proxmox_lxc" "lxc" {
  target_node  = "pve"
  hostname     = var.hostname
  ostemplate   = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  ostype       = "debian"
  cores        = var.cores
  memory       = var.memory
  password     = var.password
  unprivileged = var.unprivileged
  onboot       = true
  start        = true

  ssh_public_keys = file(var.ssh_keys["pub"])

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = var.storage_size
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }

  features {
    nesting = var.nesting
  }

  connection {
    host        = "${var.hostname}.local"
    user        = "root"
    private_key = file(var.ssh_keys["priv"])
    agent       = false
    timeout     = "1m"
  }

  provisioner "remote-exec" {
    # Leave this here so we know when to start with Ansible local-exec 
    inline = ["echo 'Cool, we are ready for provisioning'"]
  }

  provisioner "local-exec" {
    working_dir = "../../Ansible/"
    command     = "ansible-playbook provision.yml -e \"lxc_id=${split("/", self.id)[2]} lxc_hostname=${self.hostname}\""
  }
}