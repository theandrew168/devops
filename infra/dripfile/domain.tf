resource "digitalocean_domain" "dripfile" {
  name = "dripfile.com"
}

resource "digitalocean_record" "dripfile_caa_letsencrypt" {
  domain = digitalocean_domain.dripfile.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  flags  = "0"
  tag    = "issue"
}
