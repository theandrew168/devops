resource "digitalocean_spaces_bucket" "loki" {
  name   = "sbs-loki"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_droplet" "loki" {
  image  = "ubuntu-20-04-x64"
  name   = "loki"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]
}

resource "digitalocean_record" "loki_a" {
  domain = "shallowbrooksoftware.com"
  type   = "A"
  name   = "loki"
  value  = digitalocean_droplet.loki.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "loki_caa_letsencrypt" {
  domain = "shallowbrooksoftware.com"
  type   = "CAA"
  name   = "loki"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
