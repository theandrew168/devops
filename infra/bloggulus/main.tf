resource "digitalocean_spaces_bucket" "bloggulus" {
  name   = "bloggulus-backup"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_volume" "bloggulus_db" {
  name   = "bloggulus-db"
  region = "nyc1"
  size   = 50

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "bloggulus" {
  image    = "ubuntu-20-04-x64"
  name     = "bloggulus"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]

  volume_ids = [
    digitalocean_volume.bloggulus_db.id,
  ]
}

# NOTE: move back to digitalocean/domains.tf if unused
resource "digitalocean_domain" "bloggulus" {
  name = "bloggulus.com"
}

resource "digitalocean_record" "bloggulus_a" {
  domain = digitalocean_domain.bloggulus.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.bloggulus.ipv4_address
}

resource "digitalocean_record" "bloggulus_cname_www" {
  domain = digitalocean_domain.bloggulus.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "bloggulus_caa_letsencrypt" {
  domain = digitalocean_domain.bloggulus.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
