resource "digitalocean_spaces_bucket" "sbs_cdn" {
  name   = "sbs-cdn"
  region = "nyc3"
  acl    = "public-read"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}

resource "digitalocean_certificate" "sbs_cdn" {
  name    = "sbs-cdn"
  type    = "lets_encrypt"
  domains = [
    "shallowbrooksoftware.com",
    "cdn.shallowbrooksoftware.com",
  ]
}

resource "digitalocean_cdn" "sbs_cdn" {
  origin           = digitalocean_spaces_bucket.sbs_cdn.bucket_domain_name
  custom_domain    = "cdn.shallowbrooksoftware.com"
  certificate_name = digitalocean_certificate.sbs_cdn.name
}
