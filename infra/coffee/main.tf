# owner: wesley
resource "digitalocean_domain" "daileybrue" {
  name = "daileybrue.coffee"
}

# owner: wesley
resource "digitalocean_domain" "whosbuying" {
  name = "whosbuying.coffee"
}

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
  domain = digitalocean_domain.whosbuying.name
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
