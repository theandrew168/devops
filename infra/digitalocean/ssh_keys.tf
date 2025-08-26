resource "digitalocean_ssh_key" "andrew_m1_air" {
  name       = "andrew_m1_air"
  public_key = chomp(file("${path.module}/../ssh_keys/andrew_m1_air.pub"))
}

resource "digitalocean_ssh_key" "andrew_m1_pro" {
  name       = "andrew_m1_pro"
  public_key = chomp(file("${path.module}/../ssh_keys/andrew_m1_pro.pub"))
}
