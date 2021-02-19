resource "digitalocean_droplet" "thebrosmakeagame" {
  image    = "ubuntu-20-04-x64"
  name     = "thebrosmakeagame"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew.fingerprint,
  ]
}

resource "digitalocean_domain" "thebrosmakeagame" {
  name       = "thebrosmakeagame.com"
  ip_address = digitalocean_droplet.thebrosmakeagame.ipv4_address
}

resource "digitalocean_record" "thebrosmakeagame_cname_www" {
  domain = digitalocean_domain.thebrosmakeagame.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
  ttl    = "43200"
}

resource "digitalocean_record" "thebrosmakeagame_caa_letsencrypt" {
  domain = digitalocean_domain.thebrosmakeagame.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
