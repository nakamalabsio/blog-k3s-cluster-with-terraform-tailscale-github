# outputs.tf

output "k3s_master_ip" {
  value = module.k3s_master.public_ip
}

output "k3s_master_private_ip" {
  value = module.k3s_master.private_ip
}

output "k3s_master_tailscale_ip" {
  value = data.tailscale_device.k3s_master.addresses
}

output "k3s_worker_tailscale_ip" {
  value = data.tailscale_device.k3s_worker.addresses
}