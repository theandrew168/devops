# All domains live here to prevent squatting.
# Extra SPF and DMARC records are added based on:
# https://hear-me.social/@Jerry/113657096385754371

resource "digitalocean_domain" "bloggulus" {
  name = "bloggulus.com"
}

resource "digitalocean_record" "bloggulus_spf" {
  domain = "bloggulus.com"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "bloggulus_dmarc" {
  domain = "bloggulus.com"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}

resource "digitalocean_domain" "sbsbx" {
  name = "sbsbx.com"
}

resource "digitalocean_record" "sbsbx_spf" {
  domain = "sbsbx.com"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "sbsbx_dmarc" {
  domain = "sbsbx.com"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}

resource "digitalocean_domain" "jamql" {
  name = "jamql.com"
}

resource "digitalocean_record" "jamql_spf" {
  domain = "jamql.com"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "jamql_dmarc" {
  domain = "jamql.com"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}

resource "digitalocean_domain" "dripfile" {
  name = "dripfile.com"
}

resource "digitalocean_record" "dripfile_spf" {
  domain = "dripfile.com"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "dripfile_dmarc" {
  domain = "dripfile.com"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}

resource "digitalocean_domain" "crawdata_com" {
  name = "crawdata.com"
}

resource "digitalocean_record" "crawdata_com_spf" {
  domain = "crawdata.com"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "crawdata_com_dmarc" {
  domain = "crawdata.com"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}

resource "digitalocean_domain" "derztunes" {
  name = "derztunes.com"
}

resource "digitalocean_record" "derztunes_spf" {
  domain = "derztunes.com"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "derztunes_dmarc" {
  domain = "derztunes.com"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}

resource "digitalocean_domain" "stillwatersoftware" {
  name = "stillwatersoftware.com"
}

resource "digitalocean_record" "stillwatersoftware_spf" {
  domain = "stillwatersoftware.com"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "stillwatersoftware_dmarc" {
  domain = "stillwatersoftware.com"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}

resource "digitalocean_domain" "bugforth" {
  name = "bugforth.com"
}

resource "digitalocean_record" "bugforth_spf" {
  domain = "bugforth.com"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "bugforth_dmarc" {
  domain = "bugforth.com"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}

resource "digitalocean_domain" "cachebatch" {
  name = "cachebatch.com"
}

resource "digitalocean_record" "cachebatch_spf" {
  domain = "cachebatch.com"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "cachebatch_dmarc" {
  domain = "cachebatch.com"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}

# owner: wesley
resource "digitalocean_domain" "daileybrue" {
  name = "daileybrue.coffee"
}

resource "digitalocean_record" "daileybrue_spf" {
  domain = "daileybrue.coffee"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "daileybrue_dmarc" {
  domain = "daileybrue.coffee"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}

# owner: wesley
resource "digitalocean_domain" "whosbuying" {
  name = "whosbuying.coffee"
}

resource "digitalocean_record" "whosbuying_spf" {
  domain = "whosbuying.coffee"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
}

resource "digitalocean_record" "whosbuying_dmarc" {
  domain = "whosbuying.coffee"
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1; p=reject;"
}
