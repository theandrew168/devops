resource "digitalocean_record" "mowhen_mx_zoho_1" {
  domain   = digitalocean_domain.mowhen.name
  type     = "MX"
  name     = "@"
  value    = "mx.zoho.com."
  priority = 10
}

resource "digitalocean_record" "mowhen_mx_zoho_2" {
  domain   = digitalocean_domain.mowhen.name
  type     = "MX"
  name     = "@"
  value    = "mx2.zoho.com."
  priority = 20
}

resource "digitalocean_record" "mowhen_mx_zoho_3" {
  domain   = digitalocean_domain.mowhen.name
  type     = "MX"
  name     = "@"
  value    = "mx3.zoho.com."
  priority = 50
}

resource "digitalocean_record" "mowhen_txt_zoho_spf" {
  domain   = digitalocean_domain.mowhen.name
  type     = "TXT"
  name     = "@"
  value    = "v=spf1 include:zohomail.com ~all"
}

resource "digitalocean_record" "mowhen_txt_zoho_dkim" {
  domain   = digitalocean_domain.mowhen.name
  type     = "TXT"
  name     = "mowhen._domainkey"
  value    = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCYA8Otm49SivTjT0y6nwY2ZPAVMLYo1cYgeb1dDEOa0kWlVm0ICSSEsGwd9vkYSDWBCa5eRKmcvB8MUcAlJqCLVZSM8m7lLy7/QKGSvykD9fO5hXLC/rPopdTYUrVcMOXNigSX0Tt/I/kp+FVK5DBE5zrI+pkvAknH/VxD1RoBuQIDAQAB"
}

resource "digitalocean_record" "mowhen_txt_zoho_dmarc" {
  domain   = digitalocean_domain.mowhen.name
  type     = "TXT"
  name     = "_dmarc"
  value    = "v=DMARC1; p=none; rua=mailto:dmarc@mowhen.com; ruf=mailto:dmarc@mowhen.com; sp=none; adkim=r; aspf=r"
}
