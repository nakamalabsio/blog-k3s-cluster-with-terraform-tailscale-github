# network.tf

resource "hcloud_network" "private_network" {
  name     = "${var.cluster_name}-network"
  ip_range = "10.10.0.0/16"
}

resource "hcloud_network_subnet" "private_subnet" {
  network_id   = hcloud_network.private_network.id
  type         = "cloud"
  network_zone = var.region
  ip_range     = "10.10.1.0/24"
  depends_on = [
    hcloud_network.private_network
  ]
}