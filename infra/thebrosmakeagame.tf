resource "digitalocean_app" "thebrosmakeagame" {
  spec {
    name    = "thebrosmakeagame"
    region  = "nyc"

    service {
      name               = "thebrosmakeagame"
      environment_slug   = "python"
      instance_count     = 1
      instance_size_slug = "basic-xxs"

      run_command = "python3 app.py"
      http_port   = 8080

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
