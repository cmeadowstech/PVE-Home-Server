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

variable "ip" {
  description = "IP address, ending in /24"
  type        = string
}

variable "unprivileged" {
  description = "If the LXC is privileged or not"
  type        = bool
  default     = false
}

variable "nesting" {
  description = "Enable nesting?"
  type = bool
  default = false
}
