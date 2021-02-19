resource "digitalocean_droplet" "bloggulus" {
  image    = "ubuntu-20-04-x64"
  name     = "bloggulus"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew.fingerprint,
  ]
}

resource "digitalocean_domain" "bloggulus" {
  name       = "bloggulus.com"
  ip_address = digitalocean_droplet.bloggulus.ipv4_address
}

resource "digitalocean_record" "bloggulus_cname_www" {
  domain = digitalocean_domain.bloggulus.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
  ttl    = "43200"
}

resource "digitalocean_record" "bloggulus_caa_letsencrypt" {
  domain = digitalocean_domain.bloggulus.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
