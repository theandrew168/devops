resource "digitalocean_volume" "metrics_data" {
  name   = "metrics-data"
  region = "nyc1"
  size   = 50

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "metrics" {
  image  = "ubuntu-22-04-x64"
  name   = "metrics"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]

  volume_ids = [
    digitalocean_volume.metrics_data.id,
  ]
}

resource "digitalocean_record" "metrics_a" {
  domain = "sbsbx.com"
  type   = "A"
  name   = "metrics"
  value  = digitalocean_droplet.metrics.ipv4_address
}
