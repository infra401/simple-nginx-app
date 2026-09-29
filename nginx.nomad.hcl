
job "nginx-app" {
  datacenters = ["dc1"]
  type        = "service"

  group "web" {
    count = 6

    network {
      port "http" {
        static = 32222
        to     = 80
      }
    }

    service {
      name     = "nginx-service"
      port     = "http"
      provider = "nomad"
    }

    task "nginx" {
      driver = "docker"

      config {
        image = "sunaina-nginx:local"
        ports = ["http"]
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}
