resource "digitalocean_record" "sbs_mx_zoho_1" {
  domain   = digitalocean_domain.sbs.name
  type     = "MX"
  name     = "@"
  value    = "mx.zoho.com."
  priority = 10
}

resource "digitalocean_record" "sbs_mx_zoho_2" {
  domain   = digitalocean_domain.sbs.name
  type     = "MX"
  name     = "@"
  value    = "mx2.zoho.com."
  priority = 20
}

resource "digitalocean_record" "sbs_mx_zoho_3" {
  domain   = digitalocean_domain.sbs.name
  type     = "MX"
  name     = "@"
  value    = "mx3.zoho.com."
  priority = 50
}

resource "digitalocean_record" "sbs_txt_zoho_spf" {
  domain   = digitalocean_domain.sbs.name
  type     = "TXT"
  name     = "@"
  value    = "v=spf1 include:zoho.com ~all"
}

resource "digitalocean_record" "sbs_txt_zoho_dkim" {
  domain   = digitalocean_domain.sbs.name
  type     = "TXT"
  name     = "zmail._domainkey"
  value    = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCPSlzDy9b9obYdFEUJisRYsaiwd3NBGJsqSxtU1MuWu8T9s9q1OtcS8AUEkikXbNh+PTHDlSoc6AwaNONmDtZia143372bqMDueH8FT0Ijq0+cn8YSibLDyCriKc78bw+x9yrot6Aut3Lc54SNdNfvQ7kMUhQld9UvAwUNySlaDQIDAQAB"
}

resource "digitalocean_record" "sbs_txt_zoho_dmarc" {
  domain   = digitalocean_domain.sbs.name
  type     = "TXT"
  name     = "_dmarc"
  value    = "v=DMARC1; p=none; fo=1; rua=mailto:info@shallowbrooksoftware.com"
}
