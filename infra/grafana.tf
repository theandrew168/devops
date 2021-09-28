resource "digitalocean_droplet" "grafana" {
  image    = "ubuntu-20-04-x64"
  name     = "grafana"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew_macbook.fingerprint,
  ]
}

resource "digitalocean_record" "grafana_a" {
  domain = digitalocean_domain.sbs.name
  type   = "A"
  name   = "grafana"
  value  = digitalocean_droplet.grafana.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "grafana_caa_letsencrypt" {
  domain = digitalocean_domain.sbs.name
  type   = "CAA"
  name   = "grafana"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
