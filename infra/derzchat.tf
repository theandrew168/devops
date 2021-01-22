resource "digitalocean_droplet" "derzchat" {
  image    = "ubuntu-20-04-x64"
  name     = "derzchat"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew.fingerprint,
    digitalocean_ssh_key.nick.fingerprint,
  ]
}

resource "digitalocean_domain" "derzchat" {
  name       = "derzchat.com"
  ip_address = digitalocean_droplet.derzchat.ipv4_address
}

resource "digitalocean_record" "derzchat_caa_letsencrypt" {
  domain = digitalocean_domain.derzchat.name
  name   = "@"
  type   = "CAA"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
  ttl    = "3600"
}
