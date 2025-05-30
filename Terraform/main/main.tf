terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://10.0.10.2:8006/api2/json"
  pm_tls_insecure = true
  pm_user         = var.PM_USER
  pm_password     = var.PM_PASS
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

module "download" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "download"
  cores        = 2
  memory       = 4096
  password     = var.password
  storage_size = "100G"

  mountpoints = [
    {
      key     = "0"
      slot    = 0
      storage = "/storage/Downloads"
      volume  = "/storage/Downloads"
      mp      = "/mnt/downloads"
      size    = "11T"
    }
  ]
}

# module "monitor" {
#   depends_on = [module.technitium]
#   source     = "../modules/lxc"

#   hostname     = "monitor"
#   cores        = 4
#   memory       = 4090
#   password     = var.password
#   storage_size = "25G"
# }

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

  mountpoints = [
    {
      key     = "0"
      slot    = 0
      storage = "/storage"
      volume  = "/storage"
      mp      = "/mnt/storage"
      size    = "11T"
    },
    {
      key     = "1"
      slot    = 1
      storage = "/backup"
      volume  = "/backup"
      mp      = "/mnt/backup"
      size    = "3300G"
    }
  ]
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

  mountpoints = [
    {
      key     = "0"
      slot    = 0
      storage = "/storage/streaming"
      volume  = "/storage/streaming"
      mp      = "/mnt/media"
      size    = "11T"
    },
    {
      key     = "1"
      slot    = 1
      storage = "/storage/config"
      volume  = "/storage/config"
      mp      = "/mnt/config"
      size    = "11T"
    },
    {
      key     = "2"
      slot    = 2
      storage = "/storage/Downloads"
      volume  = "/storage/Downloads"
      mp      = "/mnt/downloads"
      size    = "11T"
    }
  ]
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

module "homeassistant" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "homeassistant"
  cores        = 2
  memory       = 4096
  password     = var.password
  storage_size = "32G"

  mountpoints = [
    {
      key     = "0"
      slot    = 0
      storage = "/storage/config"
      volume  = "/storage/config"
      mp      = "/mnt/config"
      size    = "32G"
    }
  ]
}

module "library" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "library"
  cores        = 2
  memory       = 2048
  password     = var.password
  storage_size = "16G"

  unprivileged = false
  nesting      = true

  mountpoints = [
    {
      key     = "0"
      slot    = 0
      storage = "/storage/config"
      volume  = "/storage/config"
      mp      = "/mnt/config"
      size    = "1T"
    },
    {
      key     = "1"
      slot    = 1
      storage = "/storage/streaming/Books"
      volume  = "/storage/streaming/Books"
      mp      = "/mnt/Books"
      size    = "1T"
    },
    {
      key     = "2"
      slot    = 2
      storage = "/storage/streaming/cwa-book-ingest"
      volume  = "/storage/streaming/cwa-book-ingest"
      mp      = "/mnt/cwa-book-ingest"
      size    = "1T"
    }
  ]
}

module "newt" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "newt"
  cores        = 2
  memory       = 2048
  password     = var.password
  storage_size = "8G"
}

module "git" {
  depends_on = [module.technitium]
  source     = "../modules/lxc"

  hostname     = "git"
  cores        = 2
  memory       = 2048
  password     = var.password
  storage_size = "8G"

  mountpoints = [
    {
      key     = "0"
      slot    = 0
      storage = "/storage/config"
      volume  = "/storage/config"
      mp      = "/mnt/config"
      size    = "1T"
    },
    {
      key     = "1"
      slot    = 1
      storage = "/storage/git"
      volume  = "/storage/git"
      mp      = "/mnt/git"
      size    = "1T"
    }
  ]
}