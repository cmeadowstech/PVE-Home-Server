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

variable "vps_domains" {
  description = "List of domain names to point to the VPS IP"
  type        = list(string)
  default     = ["*"] # "ntfy", "pocketid", "kuma", "jellyfin", "pangolin", "gerbil", "api", "audiobookshelf", "cwa", "traefik", 
}
