# modules/hetzner-k3s-node/main.tf

resource "hcloud_server" "node" {
  name        = "${var.name_prefix}-${random_id.suffix.hex}"
  server_type = var.server_type
  location    = var.location
  image       = "ubuntu-22.04"
  ssh_keys    = [var.ssh_public_key]

  user_data = var.is_master ? templatefile("${path.module}/cloud-init/master.yaml", { k3s_token = var.k3s_token, tailscale_auth_key = var.tailscale_auth_key }) : templatefile("${path.module}/cloud-init/worker.yaml", { k3s_token = var.k3s_token, k3s_master_ip = var.k3s_master_ip, tailscale_auth_key = var.tailscale_auth_key })

  labels = {
    role = var.is_master ? "master" : "worker"
  }

  network {
    network_id = var.network_id
    ip         = null # Automatic IP 
  }
}

resource "random_id" "suffix" {
  byte_length = 2
}