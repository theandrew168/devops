resource "digitalocean_spaces_bucket" "sbs_backup" {
  name   = "sbs-backup"
  region = "nyc3"
  acl    = "private"
}

# NOTE: move back to digitalocean/domains.tf if unused
resource "digitalocean_domain" "sbs" {
  name = "shallowbrooksoftware.com"
}

resource "digitalocean_record" "sbs_a_github_1" {
  domain = digitalocean_domain.sbs.name
  type   = "A"
  name   = "@"
  value  = "185.199.108.153"
}

resource "digitalocean_record" "sbs_a_github_2" {
  domain = digitalocean_domain.sbs.name
  type   = "A"
  name   = "@"
  value  = "185.199.109.153"
}

resource "digitalocean_record" "sbs_a_github_3" {
  domain = digitalocean_domain.sbs.name
  type   = "A"
  name   = "@"
  value  = "185.199.110.153"
}

resource "digitalocean_record" "sbs_a_github_4" {
  domain = digitalocean_domain.sbs.name
  type   = "A"
  name   = "@"
  value  = "185.199.111.153"
}

resource "digitalocean_record" "sbs_cname_www" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "www"
  value  = "theandrew168.github.io."
}
