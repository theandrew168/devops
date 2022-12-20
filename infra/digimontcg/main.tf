resource "digitalocean_spaces_bucket" "digimontcg_backup" {
  name   = "digimontcg-backup"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_spaces_bucket" "digimontcg_images" {
  name   = "digimontcg-images"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_volume" "digimontcg_db" {
  name   = "digimontcg-db"
  region = "nyc1"
  size   = 50

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "digimontcg" {
  image    = "ubuntu-22-04-x64"
  name     = "digimontcg"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]

  volume_ids = [
    digitalocean_volume.digimontcg_db.id,
  ]
}

# NOTE: move back to digitalocean/domains.tf if unused
resource "digitalocean_domain" "digimontcg" {
  name = "digimontcg.online"
}

resource "digitalocean_record" "digimontcg_a" {
  domain = digitalocean_domain.digimontcg.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.digimontcg.ipv4_address
}

resource "digitalocean_record" "digimontcg_cname_www" {
  domain = digitalocean_domain.digimontcg.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "digimontcg_caa_letsencrypt" {
  domain = digitalocean_domain.digimontcg.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
