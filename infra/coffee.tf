resource "digitalocean_droplet" "coffee" {
  image    = "ubuntu-20-04-x64"
  name     = "coffee"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew_macbook.fingerprint,
    digitalocean_ssh_key.wesley_thinkpad.fingerprint,
  ]
}

resource "digitalocean_record" "daileybrue_a" {
  domain = digitalocean_domain.daileybrue.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.coffee.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "daileybrue_cname_www" {
  domain = digitalocean_domain.daileybrue.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
  ttl    = "43200"
}

resource "digitalocean_record" "daileybrue_caa_letsencrypt" {
  domain = digitalocean_domain.daileybrue.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}

resource "digitalocean_record" "whosbuying_a" {
  domain = digitalocean_domain.whosbuying.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.coffee.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "whosbuying_cname_www" {
  domain = digitalocean_domain.whosebuying.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
  ttl    = "43200"
}

resource "digitalocean_record" "whosbuying_caa_letsencrypt" {
  domain = digitalocean_domain.whosbuying.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
