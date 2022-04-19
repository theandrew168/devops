resource "digitalocean_spaces_bucket" "dripfile_backup_test" {
  name   = "dripfile-backup-test"
  region = "nyc3"
  acl    = "private"
}

resource "digitalocean_volume" "dripfile_db_test" {
  name   = "dripfile-db-test"
  region = "nyc1"
  size   = 50

  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "dripfile_test" {
  image    = "ubuntu-20-04-x64"
  name     = "dripfile-test"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"

  ssh_keys = [
    "9c:f4:8b:a5:4f:97:99:60:79:50:63:61:61:18:bc:d4",
  ]

  volume_ids = [
    digitalocean_volume.dripfile_db_test.id,
  ]
}

resource "digitalocean_record" "dripfile_a_test" {
  domain = digitalocean_domain.dripfile.name
  type   = "A"
  name   = "test"
  value  = digitalocean_droplet.dripfile_test.ipv4_address
}

resource "digitalocean_record" "dripfile_cname_www_test" {
  domain = digitalocean_domain.dripfile.name
  type   = "CNAME"
  name   = "www.test"
  value  = "test.dripfile.com."
}
