resource "digitalocean_spaces_bucket" "cortex" {
  name   = "sbs-cortex"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_droplet" "cortex" {
  image  = "ubuntu-20-04-x64"
  name   = "cortex"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]
}

resource "digitalocean_record" "cortex_a" {
  domain = "shallowbrooksoftware.com"
  type   = "A"
  name   = "cortex"
  value  = digitalocean_droplet.cortex.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "cortex_caa_letsencrypt" {
  domain = "shallowbrooksoftware.com"
  type   = "CAA"
  name   = "cortex"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
