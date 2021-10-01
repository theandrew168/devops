resource "digitalocean_spaces_bucket" "tempo" {
  name   = "sbs-tempo"
  region = "nyc3"
  acl    = "private"
}
