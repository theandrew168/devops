resource "digitalocean_droplet" "coffee" {
  image  = "ubuntu-20-04-x64"
  name   = "coffee"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
    "fe:87:b1:f7:88:c3:6b:e0:90:59:05:e4:d5:dd:a9:6f",
  ]
}

# owner: wesley
# NOTE: move back to sbs/domains.tf if unused
resource "digitalocean_domain" "daileybrue" {
  name = "daileybrue.coffee"
}

resource "digitalocean_record" "daileybrue_a" {
  domain = "daileybrue.coffee"
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.coffee.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "daileybrue_cname_www" {
  domain = "daileybrue.coffee"
  type   = "CNAME"
  name   = "www"
  value  = "@"
  ttl    = "43200"
}

resource "digitalocean_record" "daileybrue_caa_letsencrypt" {
  domain = "daileybrue.coffee"
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}

# owner: wesley
# NOTE: move back to sbs/domains.tf if unused
resource "digitalocean_domain" "whosbuying" {
  name = "whosbuying.coffee"
}

resource "digitalocean_record" "whosbuying_a" {
  domain = "whosbuying.coffee"
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.coffee.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "whosbuying_cname_www" {
  domain = "whosbuying.coffee"
  type   = "CNAME"
  name   = "www"
  value  = "@"
  ttl    = "43200"
}

resource "digitalocean_record" "whosbuying_caa_letsencrypt" {
  domain = "whosbuying.coffee"
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
