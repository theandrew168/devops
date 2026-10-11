# NOTE: move back to digitalocean/domains.tf if unused
resource "digitalocean_domain" "mowhen" {
  name = "mowhen.com"
}

resource "digitalocean_spaces_bucket" "mowhen" {
  name   = "mowhen-backup"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_volume" "mowhen_db" {
  name   = "mowhen-db"
  region = "nyc1"
  size   = 10

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "mowhen" {
  image    = "ubuntu-24-04-x64"
  name     = "mowhen"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"

  ssh_keys = [
    "3b:5d:e5:df:aa:ca:62:45:09:ee:76:a6:c4:78:b0:c1",
  ]

  volume_ids = [
    digitalocean_volume.mowhen_db.id,
  ]
}

# Reserve this droplet's IP to ensure consistent allow-listing.
resource "digitalocean_reserved_ip" "mowhen" {
  droplet_id = digitalocean_droplet.mowhen.id
  region     = digitalocean_droplet.mowhen.region
}

resource "digitalocean_record" "mowhen_a" {
  domain = "mowhen.com"
  type   = "A"
  name   = "@"
  value  = digitalocean_reserved_ip.mowhen.ip_address
}

resource "digitalocean_record" "mowhen_cname_www" {
  domain = "mowhen.com"
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "mowhen_caa_letsencrypt" {
  domain = "mowhen.com"
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}