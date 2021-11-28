resource "digitalocean_droplet" "grafana" {
  image  = "ubuntu-20-04-x64"
  name   = "grafana"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]
}

resource "digitalocean_record" "grafana_a" {
  domain = "shallowbrooksoftware.com"
  type   = "A"
  name   = "grafana"
  value  = digitalocean_droplet.grafana.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "grafana_cname_www" {
  domain = "shallowbrooksoftware.com"
  type   = "CNAME"
  name   = "www.grafana"
  value  = "grafana."
  ttl    = "43200"
}

resource "digitalocean_record" "grafana_caa_letsencrypt" {
  domain = "shallowbrooksoftware.com"
  type   = "CAA"
  name   = "grafana"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
