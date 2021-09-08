resource "digitalocean_vpc" "vpc_test" {
  name     = "vpc-test"
  region   = "nyc3"
  ip_range = "10.0.0.0/24"
}

resource "digitalocean_droplet" "vpc_droplet" {
  count      = 3
  image      = "ubuntu-20-04-x64"
  name       = "vpc-droplet-${count.index}"
  region     = "nyc3"
  size       = "s-1vcpu-1gb"
  monitoring = true
  vpc_uuid   = digitalocean_vpc.vpc_test.id
  ssh_keys   = [
    digitalocean_ssh_key.andrew_macbook.fingerprint,
  ]
}
