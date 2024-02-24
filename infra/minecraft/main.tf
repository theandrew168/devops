resource "digitalocean_volume" "minecraft_data" {
  name   = "minecraft-data"
  region = "nyc1"
  size   = 50

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "minecraft" {
  image  = "ubuntu-22-04-x64"
  name   = "minecraft"
  region = "nyc1"
  size   = "s-2vcpu-2gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]

  volume_ids = [
    digitalocean_volume.minecraft_data.id,
  ]
}

resource "digitalocean_record" "minecraft_a" {
  domain = "sbsbx.com"
  type   = "A"
  name   = "mc"
  value  = digitalocean_droplet.minecraft.ipv4_address
}
