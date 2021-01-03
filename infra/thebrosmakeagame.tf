resource "digitalocean_app" "thebrosmakeagame" {
  spec {
    name    = "thebrosmakeagame"
    region  = "nyc"
    domains = ["thebrosmakeagame.com"]

    service {
      name               = "thebrosmakeagame"
      environment_slug   = "python"
      instance_count     = 1
      instance_size_slug = "basic-xxs"

      github {
        repo   = "theandrew168/thebrosmakeagame"
        branch = "main"

        deploy_on_push = true
      }

      routes {
        path = "/"
      }
    }
  }
}