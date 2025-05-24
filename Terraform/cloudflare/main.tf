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

resource "cloudflare_dns_record" "vps_domains" {
  for_each = toset(var.vps_domains)

  zone_id = var.zone_id
  name    = each.value
  content = var.vps_ip
  type    = "A"
  proxied = true
  ttl     = 1
}