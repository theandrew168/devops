resource "digitalocean_record" "dripfile_mx_zoho_1" {
  domain   = digitalocean_domain.dripfile.name
  type     = "MX"
  name     = "@"
  value    = "mx.zoho.com."
  priority = 10
}

resource "digitalocean_record" "dripfile_mx_zoho_2" {
  domain   = digitalocean_domain.dripfile.name
  type     = "MX"
  name     = "@"
  value    = "mx2.zoho.com."
  priority = 20
}

resource "digitalocean_record" "dripfile_mx_zoho_3" {
  domain   = digitalocean_domain.dripfile.name
  type     = "MX"
  name     = "@"
  value    = "mx3.zoho.com."
  priority = 50
}

resource "digitalocean_record" "dripfile_txt_zoho_spf" {
  domain   = digitalocean_domain.dripfile.name
  type     = "TXT"
  name     = "@"
  value    = "v=spf1 include:zoho.com ~all"
}

resource "digitalocean_record" "dripfile_txt_zoho_dkim" {
  domain   = digitalocean_domain.dripfile.name
  type     = "TXT"
  name     = "zmail._domainkey"
  value    = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDC5yvvQmOTga/oreslFFLA8OznLX8XE1hydqJNMy6CrL38lR/fWVZ48GSxIlNS+OCVMRDUb0qEzRL7tXWnJLW58uQPKWgNJZpuUBY8uKVjhdOUHWfGwneRq/q7CAjHAV32otx/0+P5mft7lyUpPkIjbUq2qOBwZReLeDLzo0nFWQIDAQAB"
}

resource "digitalocean_record" "dripfile_txt_zoho_dmarc" {
  domain   = digitalocean_domain.dripfile.name
  type     = "TXT"
  name     = "_dmarc"
  value    = "v=DMARC1; p=none; fo=1; rua=mailto:info@dripfile.com"
}
