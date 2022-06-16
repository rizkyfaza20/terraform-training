terraform {
  required_version = "1.2.3"
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.7"
    }
  }
}

provider "docker" {
  version = "~> 2.6"
  host    = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name = "terraform_tutorial"
  ports {
    internal = 80
    external = 8000
  }
}