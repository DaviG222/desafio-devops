
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Rede compartilhada entre os containers
resource "docker_network" "devops_net" {
  name = "devops-network"
}

# Imagem do site
resource "docker_image" "site" {
  name         = "desafio-devops-site:latest"
  keep_locally = true
}

# Container do site
resource "docker_container" "site" {
  name  = "hello-world-tf"
  image = docker_image.site.image_id

  ports {
    internal = 80
    external = 8090
  }

  networks_advanced {
    name = docker_network.devops_net.name
  }
}

# Imagem do Prometheus
resource "docker_image" "prometheus" {
  name = "prom/prometheus:latest"
}

# Container do Prometheus
resource "docker_container" "prometheus" {
  name  = "prometheus-tf"
  image = docker_image.prometheus.image_id

  ports {
    internal = 9090
    external = 9091
  }

  volumes {
    host_path      = "/home/suporte/desafio-devops/prometheus/prometheus.yml"
    container_path = "/etc/prometheus/prometheus.yml"
  }

  networks_advanced {
    name = docker_network.devops_net.name
  }
}

# Imagem do Grafana
resource "docker_image" "grafana" {
  name = "grafana/grafana:latest"
}

# Container do Grafana
resource "docker_container" "grafana" {
  name  = "grafana-tf"
  image = docker_image.grafana.image_id

  ports {
    internal = 3000
    external = 3001
  }

  env = [
    "GF_SECURITY_ADMIN_USER=admin",
    "GF_SECURITY_ADMIN_PASSWORD=admin123"
  ]

  networks_advanced {
    name = docker_network.devops_net.name
  }
}