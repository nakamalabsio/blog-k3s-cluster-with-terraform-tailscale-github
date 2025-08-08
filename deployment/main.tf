data "hcloud_ssh_key" "ssh_key" {
  name = var.hcloud_ssh_key
}

data "tailscale_device" "k3s_master" {
  hostname   = module.k3s_master.name
  wait_for   = "60s"
  depends_on = [module.k3s_master]
}

data "tailscale_device" "k3s_worker" {
  hostname   = module.k3s_worker.name
  wait_for   = "60s"
  depends_on = [module.k3s_worker]
}

module "k3s_master" {
  source             = "./modules/hetzner-k3s-node"
  name_prefix        = "${var.cluster_name}-master"
  server_type        = var.server_type
  location           = var.location
  is_master          = true
  k3s_token          = var.k3s_token
  k3s_master_ip      = null
  ssh_public_key     = data.hcloud_ssh_key.ssh_key.name
  network_id         = hcloud_network.private_network.id
  tailscale_auth_key = var.tailscale_auth_key
  depends_on = [
    hcloud_network_subnet.private_subnet,
  ]
}

module "k3s_worker" {
  source             = "./modules/hetzner-k3s-node"
  name_prefix        = "${var.cluster_name}-worker"
  server_type        = var.server_type
  location           = var.location
  is_master          = false
  k3s_token          = var.k3s_token
  k3s_master_ip      = module.k3s_master.private_ip
  ssh_public_key     = data.hcloud_ssh_key.ssh_key.name
  network_id         = hcloud_network.private_network.id
  tailscale_auth_key = var.tailscale_auth_key
  depends_on = [
    hcloud_network_subnet.private_subnet,
    module.k3s_master
  ]
}