resource "linode_instance" "dsmfactor" {
  label  = "dsmfactor"
  image  = "linode/ubuntu20.04"
  region = "us-southeast"
  type   = "g6-nanode-1"

  authorized_keys = [
    chomp(file("${path.module}/../ssh_keys/andrew_macbook.pub")),
  ]
}

# NOTE: move back to linode/domains.tf if unused
resource "linode_domain" "dsmfactor" {
  type      = "master"
  domain    = "dsmfactor.app"
  soa_email = "info@shallowbrooksoftware.com"
}

resource "linode_domain_record" "dsmfactor_a" {
  domain_id   = linode_domain.dsmfactor.id
  record_type = "A"
  target      = linode_instance.dsmfactor.ip_address
}

resource "linode_domain_record" "dsmfactor_cname_www" {
  domain_id   = linode_domain.dsmfactor.id
  record_type = "CNAME"
  target      = linode_domain.dsmfactor.domain
  name        = "www"
}

resource "linode_domain_record" "dsmfactor_caa_letsencrypt" {
  domain_id   = linode_domain.dsmfactor.id
  record_type = "CAA"
  target      = "letsencrypt.org"
  tag         = "issue"
}
