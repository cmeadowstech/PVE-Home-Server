terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_dns_record" "ntfy" {
  zone_id = var.zone_id
  name    = "ntfy"
  content = var.vps_ip
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "pocketid" {
  zone_id = var.zone_id
  name    = "pocketid"
  content = var.vps_ip
  type    = "A"
  proxied = false
  ttl     = 1
}