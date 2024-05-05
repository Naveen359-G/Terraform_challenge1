# mariadb_volume.tf

resource "docker_volume" "mariadb_volume" {
  name = "mariadb-volume"
}
