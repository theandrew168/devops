resource "digitalocean_ssh_key" "andrew_macbook" {
  name       = "andrew_macbook"
  public_key = chomp(file("${path.module}/ssh_keys/andrew_macbook.pub"))
}

resource "digitalocean_ssh_key" "andrew_thinkpad" {
  name       = "andrew_thinkpad"
  public_key = chomp(file("${path.module}/ssh_keys/andrew_thinkpad.pub"))
}
