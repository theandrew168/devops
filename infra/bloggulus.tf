resource "digitalocean_droplet" "bloggulus" {
  image    = "ubuntu-20-04-x64"
  name     = "bloggulus"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.andrew_macbook.fingerprint,
  ]
}

resource "digitalocean_volume" "bloggulus" {
  name   = "bloggulus"
  region = "nyc1"
  size   = 50

  initial_filesystem_type = "ext4"
}

resource "digitalocean_volume_attachment" "bloggulus" {
  droplet_id = digitalocean_droplet.bloggulus.id
  volume_id  = digitalocean_volume.bloggulus.id
}

resource "digitalocean_record" "bloggulus_a" {
  domain = digitalocean_domain.bloggulus.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.bloggulus.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "bloggulus_cname_www" {
  domain = digitalocean_domain.bloggulus.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
  ttl    = "43200"
}

resource "digitalocean_record" "bloggulus_caa_letsencrypt" {
  domain = digitalocean_domain.bloggulus.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
