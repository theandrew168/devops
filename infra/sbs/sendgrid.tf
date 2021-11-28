resource "digitalocean_record" "sbs_sendgrid_cname1" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "url7023"
  value  = "sendgrid.net."
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_sendgrid_cname2" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "22828247"
  value  = "sendgrid.net."
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_sendgrid_cname3" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "em8428"
  value  = "u22828247.wl248.sendgrid.net."
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_sendgrid_cname4" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "s1._domainkey"
  value  = "s1.domainkey.u22828247.wl248.sendgrid.net."
  ttl    = "43200"
}

resource "digitalocean_record" "sbs_sendgrid_cname5" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "s2._domainkey"
  value  = "s2.domainkey.u22828247.wl248.sendgrid.net."
  ttl    = "43200"
}
