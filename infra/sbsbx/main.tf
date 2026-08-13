resource "digitalocean_volume" "sbsbx_data" {
  name   = "sbsbx-data"
  region = "nyc1"
  size   = 10

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "sbsbx" {
  image  = "ubuntu-24-04-x64"
  name   = "sbsbx"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    "3b:5d:e5:df:aa:ca:62:45:09:ee:76:a6:c4:78:b0:c1",
  ]

  volume_ids = [
    digitalocean_volume.sbsbx_data.id,
  ]
}

// DNS records for sbsbx.com
resource "digitalocean_record" "sbsbx_a" {
  domain = "sbsbx.com"
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.sbsbx.ipv4_address
}

resource "digitalocean_record" "sbsbx_cname_www" {
  domain = "sbsbx.com"
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "sbsbx_caa_letsencrypt" {
  domain = "sbsbx.com"
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}

// DNS records for melt.sbsbx.com
resource "digitalocean_record" "melt_sbsbx_a" {
  domain = "sbsbx.com"
  type   = "A"
  name   = "melt"
  value  = digitalocean_droplet.sbsbx.ipv4_address
}

resource "digitalocean_record" "melt_sbsbx_cname_www" {
  domain = "sbsbx.com"
  type   = "CNAME"
  name   = "www.melt"
  value  = "melt.sbsbx.com."
}

resource "digitalocean_record" "melt_sbsbx_caa_letsencrypt" {
  domain = "sbsbx.com"
  type   = "CAA"
  name   = "melt"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
