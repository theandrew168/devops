resource "digitalocean_droplet" "bloggulus" {
  image    = "ubuntu-20-04-x64"
  name     = "bloggulus"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew.fingerprint,
    digitalocean_ssh_key.nick.fingerprint,
  ]
}

resource "digitalocean_domain" "bloggulus" {
  name       = "bloggulus.com"
  ip_address = digitalocean_droplet.bloggulus.ipv4_address
}

resource "digitalocean_record" "bloggulus_caa_letsencrypt" {
  domain = digitalocean_domain.bloggulus.name
  name   = "@"
  type   = "CAA"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
  ttl    = "3600"
}
