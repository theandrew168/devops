resource "digitalocean_droplet" "sbsbx" {
  image    = "ubuntu-22-04-x64"
  name     = "sbsbx"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]
}

# NOTE: move back to digitalocean/domains.tf if unused
resource "digitalocean_domain" "sbsbx" {
  name = "sbsbx.com"
}

resource "digitalocean_record" "sbsbx_a" {
  domain = digitalocean_domain.sbsbx.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.sbsbx.ipv4_address
}

resource "digitalocean_record" "sbsbx_cname_www" {
  domain = digitalocean_domain.sbsbx.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "sbsbx_caa_letsencrypt" {
  domain = digitalocean_domain.sbsbx.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
