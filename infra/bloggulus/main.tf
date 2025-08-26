resource "digitalocean_spaces_bucket" "bloggulus" {
  name   = "bloggulus-backup"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_volume" "bloggulus_db" {
  name   = "bloggulus-db"
  region = "nyc1"
  size   = 10

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "bloggulus" {
  image    = "ubuntu-24-04-x64"
  name     = "bloggulus"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"

  ssh_keys = [
    "3b:5d:e5:df:aa:ca:62:45:09:ee:76:a6:c4:78:b0:c1",
  ]

  volume_ids = [
    digitalocean_volume.bloggulus_db.id,
  ]
}

# Reserve this droplet's IP to ensure consistent allow-listing.
resource "digitalocean_reserved_ip" "bloggulus" {
  droplet_id = digitalocean_droplet.bloggulus.id
  region     = digitalocean_droplet.bloggulus.region
}

resource "digitalocean_record" "bloggulus_a" {
  domain = "bloggulus.com"
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.bloggulus.ipv4_address
}

resource "digitalocean_record" "bloggulus_cname_www" {
  domain = "bloggulus.com"
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "bloggulus_caa_letsencrypt" {
  domain = "bloggulus.com"
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
