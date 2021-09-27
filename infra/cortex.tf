resource "digitalocean_droplet" "cortex" {
  image    = "ubuntu-20-04-x64"
  name     = "cortex"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew_macbook.fingerprint,
  ]
}

resource "digitalocean_record" "cortex_a" {
  domain = digitalocean_domain.sbs.name
  type   = "A"
  name   = "cortex"
  value  = digitalocean_droplet.cortex.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "cortex_caa_letsencrypt" {
  domain = digitalocean_domain.sbs.name
  type   = "CAA"
  name   = "cortex"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
