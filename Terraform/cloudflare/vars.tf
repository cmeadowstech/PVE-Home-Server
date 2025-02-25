variable "cloudflare_api_token" {
  description = "API Token for Cloudflare"
  type        = string
  sensitive   = true
}

variable "zone_id" {
  type    = string
  default = "67d9192af2910dced3708e72bb4eeaac"
}

variable "vps_ip" {
  type    = string
  default = "173.255.230.134"
}