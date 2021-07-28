# virtually hosted on the bloggulus droplet

resource "digitalocean_record" "sbs_a" {
  domain = digitalocean_domain.sbs.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.bloggulus.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "sbs_cname_www" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_caa_letsencrypt" {
  domain = digitalocean_domain.sbs.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}

resource "digitalocean_record" "sbs_cname_status" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "status"
  value  = "stats.uptimerobot.com."
  ttl    = "43200"
}

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

resource "digitalocean_record" "sbs_sendgrid_cname1" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "url7023"
  value  = "sendgrid.net."
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_sendgrid_cname2" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "22828247"
  value  = "sendgrid.net."
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_sendgrid_cname3" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "em8428"
  value  = "u22828247.wl248.sendgrid.net."
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_sendgrid_cname4" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "s1._domainkey"
  value  = "s1.domainkey.u22828247.wl248.sendgrid.net."
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_sendgrid_cname5" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "s2._domainkey"
  value  = "s2.domainkey.u22828247.wl248.sendgrid.net."
  ttl    = "43200"
}
