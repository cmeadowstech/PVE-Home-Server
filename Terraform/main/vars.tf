variable "password" {
  description = "Password for root user"
  type        = string
  sensitive   = true
}

variable "PM_USER" {
  type      = string
  sensitive = true
}

variable "PM_PASS" {
  type      = string
  sensitive = true
}