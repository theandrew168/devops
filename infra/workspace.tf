resource "digitalocean_record" "sbs_google_mx" {
  domain   = digitalocean_domain.sbs.name
  type     = "MX"
  name     = "@"
  value    = "aspmx.l.google.com."
  priority = 1
  ttl      = "3600"
}

resource "digitalocean_record" "sbs_google_mx_alt1" {
  domain   = digitalocean_domain.sbs.name
  type     = "MX"
  name     = "@"
  value    = "alt1.aspmx.l.google.com."
  priority = 5
  ttl      = "3600"
}

resource "digitalocean_record" "sbs_google_mx_alt2" {
  domain   = digitalocean_domain.sbs.name
  type     = "MX"
  name     = "@"
  value    = "alt2.aspmx.l.google.com."
  priority = 5
  ttl      = "3600"
}

resource "digitalocean_record" "sbs_google_mx_alt3" {
  domain   = digitalocean_domain.sbs.name
  type     = "MX"
  name     = "@"
  value    = "alt3.aspmx.l.google.com."
  priority = 10
  ttl      = "3600"
}

resource "digitalocean_record" "sbs_google_mx_alt4" {
  domain   = digitalocean_domain.sbs.name
  type     = "MX"
  name     = "@"
  value    = "alt4.aspmx.l.google.com."
  priority = 10
  ttl      = "3600"
}
