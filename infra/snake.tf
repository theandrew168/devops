# virtually hosted on the bloggulus droplet

resource "digitalocean_record" "sandbox_snake_a" {
  domain = digitalocean_domain.sandbox.name
  type   = "A"
  name   = "snake"
  value  = digitalocean_droplet.bloggulus.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "sandbox_snake_cname_www" {
  domain = digitalocean_domain.sandbox.name
  type   = "CNAME"
  name   = "www.snake"
  value  = "snake.shallowbrooksandbox.com."
  ttl    = "43200"
}

resource "digitalocean_record" "sandbox_snake_caa_letsencrypt" {
  domain = digitalocean_domain.sandbox.name
  type   = "CAA"
  name   = "snake"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}
