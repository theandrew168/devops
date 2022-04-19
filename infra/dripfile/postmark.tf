resource "digitalocean_record" "dripfile_txt_postmark_dkim" {
  domain   = digitalocean_domain.dripfile.name
  type     = "TXT"
  name     = "20220216184740pm._domainkey"
  value    = "k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCVigybGXHcl+lZZMRsulyMCa4oGSXyPxAyrEH4ETRaIfrK/jmo4C+4b03u8iWTih0SOn58ynzQOo/Mi7i6r8WBk166PVk2HZmDt1YpYJWH+C+Qdgi972paPLziz9OnezsAJWJEzPjWObsd7VciPap4PyuyZx2TgXICnd1GGwWsBwIDAQAB"
}

resource "digitalocean_record" "dripfile_cname_postmark_bounces" {
  domain = digitalocean_domain.dripfile.name
  type   = "CNAME"
  name   = "pm-bounces"
  value  = "pm.mtasv.net."
}
