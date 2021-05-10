resource "digitalocean_ssh_key" "andrew" {
  name       = "andrew"
  public_key = chomp(file("${path.module}/ssh_keys/andrew.pub"))
}
