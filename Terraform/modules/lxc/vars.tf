variable "ssh_keys" {
  type = map(any)
  default = {
    pub  = "~/.ssh/pve-server.pub"
    priv = "~/.ssh/pve-server"
  }
  sensitive = true
}

variable "password" {
  description = "Password for root user"
  type        = string
  sensitive   = true
}

variable "hostname" {
  description = "Hostname"
  type        = string
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
}

variable "memory" {
  description = "How much memory, in MB"
  type        = number
}

variable "unprivileged" {
  description = "If the LXC is privileged or not"
  type        = bool
  default     = true
}

variable "nesting" {
  description = "Enable nesting?"
  type        = bool
  default     = false
}

variable "storage_size" {
  description = "How much storage to give the LXC"
  type        = string
  default     = "8G"
}

variable "gateway" {
  description = "IPv4 gateway address"
  type        = string
  default     = ""
}

variable "ipv4" {
  description = "Static IPv4 address"
  type        = string
  default     = "dhcp"
}

variable "ostemplate" {
  description = "Template for LXC"
  type        = string
  default     = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
}