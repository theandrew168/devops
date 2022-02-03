# unused domains live here to prevent squatting

resource "linode_domain" "sbs" {
  type      = "master"
  domain    = "shallowbrooksoftware.com"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "sandbox" {
  type      = "master"
  domain    = "shallowbrooksandbox.com"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "bloggulus" {
  type      = "master"
  domain    = "bloggulus.com"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "thebrosmakeagame" {
  type      = "master"
  domain    = "thebrosmakeagame.com"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "derzchat" {
  type      = "master"
  domain    = "derzchat.com"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "derzfiles" {
  type      = "master"
  domain    = "derzfiles.com"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "simpleriscv" {
  type      = "master"
  domain    = "simpleriscv.org"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "nwrsolutions" {
  type      = "master"
  domain    = "nwr.solutions"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "crawdata_dev" {
  type      = "master"
  domain    = "crawdata.dev"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "crawdata_com" {
  type      = "master"
  domain    = "crawdata.com"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "crawdata_net" {
  type      = "master"
  domain    = "crawdata.net"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain" "crawdata_org" {
  type      = "master"
  domain    = "crawdata.org"
  soa_email = "info@shallowbrooksoftware.com"
}

# owner: wesley
resource "linode_domain" "daileybrue" {
  type      = "master"
  domain    = "daileybrue.coffee"
  soa_email = "info@shallowbrooksoftware.com"
}

# owner: wesley
resource "linode_domain" "whosbuying" {
  type      = "master"
  domain    = "whosbuying.coffee"
  soa_email = "info@shallowbrooksoftware.com"
}
