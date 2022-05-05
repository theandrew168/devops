resource "digitalocean_droplet" "sandbox" {
  image  = "ubuntu-22-04-x64"
  name   = "sandbox"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]
}

resource "digitalocean_domain" "sandbox" {
  name = "shallowbrooksandbox.com"
}

resource "digitalocean_record" "sandbox_a" {
  domain = digitalocean_domain.sandbox.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.sandbox.ipv4_address
}

resource "digitalocean_record" "sandbox_cname_www" {
  domain = digitalocean_domain.sandbox.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "sandbox_caa_letsencrypt" {
  domain = digitalocean_domain.sandbox.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
