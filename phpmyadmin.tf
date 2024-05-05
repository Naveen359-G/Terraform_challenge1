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

iac-server $ cat phpmyadmin.tf 
# phpmyadmin.tf

resource "docker_container" "db_dashboard" {
  name  = "db_dashboard"
  image = "phpmyadmin/phpmyadmin"

  ports {
    internal = 80
    external = 8081
  }

  depends_on = [docker_container.db]

  network_mode = "my_network"

  links = ["${docker_container.db.name}:db"]
}
