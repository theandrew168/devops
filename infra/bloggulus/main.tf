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
  image    = "ubuntu-22-04-x64"
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

// DNS records for svelte.bloggulus.com
resource "digitalocean_record" "svelte_bloggulus_a" {
  domain = "bloggulus.com"
  type   = "A"
  name   = "svelte"
  value  = digitalocean_droplet.bloggulus.ipv4_address
}

resource "digitalocean_record" "svelte_bloggulus_cname_www" {
  domain = "bloggulus.com"
  type   = "CNAME"
  name   = "www.svelte"
  value  = "svelte."
}

resource "digitalocean_record" "svelte_bloggulus_caa_letsencrypt" {
  domain = "bloggulus.com"
  type   = "CAA"
  name   = "svelte"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
