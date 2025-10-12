resource "digitalocean_record" "mowhen_txt_postmark_dkim" {
  domain = digitalocean_domain.mowhen.name
  type   = "TXT"
  name   = "20251011233856pm._domainkey"
  value  = "k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC3HMNkqIqedRahfkl+Q7Uy9w3LDEBzOGoxPudp0vnZ0XnIcstHQSl3qTpULmHLeRBeGkHIk0avcMZd25bftkrg+uTl8EVfiAbhsMchvUUvg2M0Dv9SQaKBkAtjivBH/alDcnWaLNuSLNZFVld4OKcj3df9XI9bF9SIoaffZzkvbQIDAQAB"
}

resource "digitalocean_record" "mowhen_cname_postmark_bounces" {
  domain = digitalocean_domain.mowhen.name
  type   = "CNAME"
  name   = "pm-bounces"
  value  = "pm.mtasv.net."
}
