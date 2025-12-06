resource "digitalocean_spaces_bucket" "derztunes" {
  name   = "derztunes"
  region = "nyc3"
  acl    = "private"
}
