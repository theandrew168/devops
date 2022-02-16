resource "digitalocean_record" "sbs_txt_postmark_dkim" {
  domain   = digitalocean_domain.sbs.name
  type     = "TXT"
  name     = "20220216153311pm._domainkey"
  value    = "k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCReyriMRZMOFKmyHC4J9U15gzuXo/do52l904OtHO/UI4tDbr7kRJ2TB0zr3RcRpI+ikbjBL8drLdpx5lxJoXGvmT5EEXlUoTrdVlVZl14WWnJY+4Uqgs6c3tzqtKG/9lqte5spVpAw2Q/kPxl98EDDV9bZA9LsWK88nZq2Y6CKwIDAQAB"
}

resource "digitalocean_record" "sbs_cname_postmark_bounces" {
  domain = digitalocean_domain.sbs.name
  type   = "CNAME"
  name   = "pm-bounces"
  value  = "pm.mtasv.net."
}
