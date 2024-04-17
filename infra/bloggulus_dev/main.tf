resource "digitalocean_volume" "bloggulus_db" {
  name   = "bloggulus-dev-db"
  region = "nyc1"
  size   = 10

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "bloggulus" {
  image    = "ubuntu-22-04-x64"
  name     = "bloggulus-dev"
  region   = "nyc1"
  size     = "s-1vcpu-512mb-10gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]

  volume_ids = [
    digitalocean_volume.bloggulus_db.id,
  ]
}

resource "digitalocean_record" "bloggulus_a" {
  domain = "bloggulus.com"
  type   = "A"
  name   = "dev"
  value  = digitalocean_droplet.bloggulus.ipv4_address
}

resource "digitalocean_record" "bloggulus_cname_www" {
  domain = "bloggulus.com"
  type   = "CNAME"
  name   = "www.dev"
  value  = "dev.bloggulus.com."
}

resource "digitalocean_record" "bloggulus_caa_letsencrypt" {
  domain = "bloggulus.com"
  type   = "CAA"
  name   = "dev"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
