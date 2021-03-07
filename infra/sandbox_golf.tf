resource "digitalocean_droplet" "sandbox_golf" {
  image    = "ubuntu-20-04-x64"
  name     = "sandbox-golf"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew.fingerprint,
  ]
}

resource "digitalocean_record" "sandbox_golf_a" {
  domain = digitalocean_domain.sandbox.name
  type   = "A"
  name   = "golf"
  value  = digitalocean_droplet.sandbox_golf.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "sandbox_golf_cname_www" {
  domain = digitalocean_domain.sandbox.name
  type   = "CNAME"
  name   = "www.golf"
  value  = "golf.shallowbrooksandbox.com."
  ttl    = "43200"
}

resource "digitalocean_record" "sandbox_golf_caa_letsencrypt" {
  domain = digitalocean_domain.sandbox.name
  type   = "CAA"
  name   = "golf"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
