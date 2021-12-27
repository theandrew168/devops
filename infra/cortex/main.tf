resource "digitalocean_spaces_bucket" "cortex" {
  name   = "sbs-cortex"
  region = "nyc3"
  acl    = "private"
}
