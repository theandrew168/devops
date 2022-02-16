resource "digitalocean_spaces_bucket" "sbs_backup" {
  name   = "sbs-backup"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_droplet" "sbs_wp" {
  image  = "ubuntu-20-04-x64"
  name   = "sbs-wp"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]
}

resource "digitalocean_domain" "sbs_wp" {
  name = "shallowbrooksandbox.com"
}

resource "digitalocean_record" "sbs_wp_a" {
  domain = digitalocean_domain.sbs_wp.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.sbs_wp.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "sbs_wp_cname_www" {
  domain = digitalocean_domain.sbs_wp.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_wp_caa_letsencrypt" {
  domain = digitalocean_domain.sbs_wp.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
