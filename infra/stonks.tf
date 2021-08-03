# virtually hosted on the datomic droplet

resource "digitalocean_record" "sandbox_stonks_a" {
  domain = digitalocean_domain.sandbox.name
  type   = "A"
  name   = "stonks"
  value  = digitalocean_droplet.datomic.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "sandbox_stonks_cname_www" {
  domain = digitalocean_domain.sandbox.name
  type   = "CNAME"
  name   = "www.stonks"
  value  = "stonks.shallowbrooksandbox.com."
  ttl    = "43200"
}

resource "digitalocean_record" "sandbox_stonks_caa_letsencrypt" {
  domain = digitalocean_domain.sandbox.name
  type   = "CAA"
  name   = "stonks"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
