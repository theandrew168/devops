resource "digitalocean_droplet" "datomic" {
  image    = "ubuntu-20-04-x64"
  name     = "datomic"
  region   = "nyc1"
  size     = "s-2vcpu-4gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew_macbook.fingerprint,
    digitalocean_ssh_key.wesley_klang.fingerprint,
  ]
}

resource "digitalocean_record" "datomic_a" {
  domain = digitalocean_domain.sandbox.name
  type   = "A"
  name   = "datomic"
  value  = digitalocean_droplet.datomic.ipv4_address
  ttl    = "3600"
}
