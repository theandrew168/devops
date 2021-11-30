# TODO: should these live elsewhere?
# linking records by domain ID makes a multi-proj dir structure fussy
resource "linode_domain" "jamql" {
  type      = "master"
  domain    = "jamql.com"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_instance" "jamql" {
  label  = "jamql"
  image  = "linode/ubuntu20.04"
  region = "us-central"
  type   = "g6-nanode-1"

  authorized_keys = [
    chomp(file("${path.module}/../ssh_keys/andrew_macbook.pub")),
  ]
}

resource "linode_domain_record" "jamql_a" {
  domain_id   = linode_domain.jamql.id
  record_type = "A"
  target      = linode_instance.jamql.ip_address
}

resource "linode_domain_record" "jamql_cname_www" {
  domain_id   = linode_domain.jamql.id
  record_type = "CNAME"
  target      = linode_domain.jamql.domain
  name        = "www"
}

resource "linode_domain_record" "jamql_caa_letsencrypt" {
  domain_id   = linode_domain.jamql.id
  record_type = "CAA"
  target      = "letsencrypt.org"
  tag         = "issue"
}
