resource "digitalocean_spaces_bucket" "loki" {
  name   = "sbs-loki"
  region = "nyc3"
  acl    = "private"
}
