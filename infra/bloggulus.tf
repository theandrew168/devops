resource "digitalocean_spaces_bucket" "bloggulus" {
  name   = "bloggulus-backup"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_vpc" "bloggulus" {
  name     = "bloggulus"
  region   = "nyc1"
  ip_range = "10.0.0.0/24"
}

resource "digitalocean_volume" "bloggulus_db" {
  name   = "bloggulus-db"
  region = "nyc1"
  size   = 50

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "bloggulus_db" {
  image      = "ubuntu-20-04-x64"
  name       = "bloggulus-db"
  region     = "nyc1"
  size       = "s-1vcpu-1gb"
  monitoring = true
  vpc_uuid   = digitalocean_vpc.bloggulus.id
  volume_ids = [
    digitalocean_volume.bloggulus_db.id
  ]
  ssh_keys   = [
    digitalocean_ssh_key.andrew_macbook.fingerprint,
  ]
}

resource "digitalocean_droplet" "bloggulus_web" {
  image      = "ubuntu-20-04-x64"
  name       = "bloggulus-web"
  region     = "nyc1"
  size       = "s-1vcpu-1gb"
  monitoring = true
  vpc_uuid   = digitalocean_vpc.bloggulus.id
  ssh_keys   = [
    digitalocean_ssh_key.andrew_macbook.fingerprint,
  ]
}

resource "digitalocean_record" "bloggulus_a" {
  domain = digitalocean_domain.bloggulus.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.bloggulus_web.ipv4_address
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
