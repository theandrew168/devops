resource "digitalocean_app" "thebrosmakeagame" {
  spec {
    name    = "thebrosmakeagame"
    region  = "nyc"
    domains = ["thebrosmakeagame.com"]

    database {
      name       = "db"
      engine     = "PG"
      production = false
      version    = "12"
    }

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

      env {
        key   = "DATABASE_URL"
        value = "$${db.DATABASE_URL}"
        scope = "RUN_TIME"
      }

      routes {
        path = "/"
      }
    }
  }
}
