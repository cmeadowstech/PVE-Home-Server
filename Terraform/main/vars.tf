variable "password" {
  description = "Password for root user"
  type        = string
  sensitive   = true
}

variable "pm_api_token_id" {
  type      = string
  sensitive = true
}

variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}