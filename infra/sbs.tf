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
