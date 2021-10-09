resource "digitalocean_record" "sbs_cname_status" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "status"
  value  = "stats.uptimerobot.com."
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_cname_cpm" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "cpm"
  value  = "stats.uptimerobot.com."
  ttl    = "43200"
}