resource "digitalocean_droplet" "sandbox_metrics" {
  image    = "ubuntu-20-04-x64"
  name     = "sandbox-metrics"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew.fingerprint,
  ]
}

resource "digitalocean_record" "sandbox_metrics_a" {
  domain = digitalocean_domain.sandbox.name
  type   = "A"
  name   = "metrics"
  value  = digitalocean_droplet.sandbox_metrics.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "sandbox_metrics_cname_www" {
  domain = digitalocean_domain.sandbox.name
  type   = "CNAME"
  name   = "www.metrics"
  value  = "metrics.shallowbrooksandbox.com."
  ttl    = "43200"
}

resource "digitalocean_record" "sandbox_metrics_caa_letsencrypt" {
  domain = digitalocean_domain.sandbox.name
  type   = "CAA"
  name   = "metrics"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
