# mariadb.tf
resource "docker_container" "db" {
  name  = "db"
  image = "mariadb:challenge"

  ports {
    internal = 3306
    external = 3306
  }

  env = [
    "MYSQL_ROOT_PASSWORD=1234",
    "MYSQL_DATABASE=simple-website",
  ]

  network_mode = "my_network"

  volumes {
    host_path      = "/root/code/terraform-challenges/challenge2/lamp_stack/database_data/"
    container_path = "/var/lib/mysql"
  }
}
