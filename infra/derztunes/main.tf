resource "digitalocean_spaces_bucket" "derztunes" {
  name   = "derztunes"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_spaces_bucket" "derztunes_demo" {
  name   = "derztunes-demo"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_volume" "derztunes_db" {
  name   = "derztunes-db"
  region = "nyc1"
  size   = 10

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "derztunes" {
  image    = "ubuntu-24-04-x64"
  name     = "derztunes"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]

  volume_ids = [
    digitalocean_volume.derztunes_db.id,
  ]
}

// DNS records for derztunes.com
resource "digitalocean_record" "derztunes_a" {
  domain = "derztunes.com"
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.derztunes.ipv4_address
}

resource "digitalocean_record" "derztunes_cname_www" {
  domain = "derztunes.com"
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "derztunes_caa_letsencrypt" {
  domain = "derztunes.com"
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}

// DNS records for demo.derztunes.com
resource "digitalocean_record" "derztunes_demo_a" {
  domain = "derztunes.com"
  type   = "A"
  name   = "demo"
  value  = digitalocean_droplet.derztunes.ipv4_address
}

resource "digitalocean_record" "derztunes_demo_cname_www" {
  domain = "derztunes.com"
  type   = "CNAME"
  name   = "www.demo"
  value  = "demo."
}

resource "digitalocean_record" "derztunes_demo_caa_letsencrypt" {
  domain = "derztunes.com"
  type   = "CAA"
  name   = "demo"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
