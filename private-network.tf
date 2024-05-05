# private-network.tf

resource "docker_network" "private_network" {
  name                = "my_network"
  internal            = false
  attachable          = true
}
