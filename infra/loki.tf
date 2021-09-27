resource "digitalocean_droplet" "loki" {
  image    = "ubuntu-20-04-x64"
  name     = "loki"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew_macbook.fingerprint,
  ]
}

resource "digitalocean_record" "loki_a" {
  domain = digitalocean_domain.sbs.name
  type   = "A"
  name   = "loki"
  value  = digitalocean_droplet.loki.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "loki_caa_letsencrypt" {
  domain = digitalocean_domain.sbs.name
  type   = "CAA"
  name   = "loki"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
