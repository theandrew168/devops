resource "digitalocean_droplet" "sbs" {
  image  = "ubuntu-20-04-x64"
  name   = "sbs"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]
}

# NOTE: move back to digitalocean/domains.tf if unused
resource "digitalocean_domain" "sbs" {
  name = "shallowbrooksoftware.com"
}

resource "digitalocean_record" "sbs_a" {
  domain = digitalocean_domain.sbs.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.sbs.ipv4_address
}

resource "digitalocean_record" "sbs_cname_www" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "sbs_caa_letsencrypt" {
  domain = digitalocean_domain.sbs.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
