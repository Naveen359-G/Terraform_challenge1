
# php-httpd.tf
resource "docker_container" "webserver" {
  name  = "webserver"
  image = "php-httpd:challenge"

  ports {
    internal = 80
    external = 80
  }

  network_mode = "my_network"

  volumes {
    host_path      = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path = "/var/www/html"
  }
}
