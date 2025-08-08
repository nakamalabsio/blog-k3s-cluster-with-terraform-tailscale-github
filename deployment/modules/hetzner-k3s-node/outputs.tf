# modules/hetzner-k3s-node/outputs.tf

output "public_ip" {
  value = hcloud_server.node.ipv4_address
}
output "private_ip" {
  value = tolist(hcloud_server.node.network)[0].ip
}
output "name" {
  value = hcloud_server.node.name
}
output "id" {
  value = hcloud_server.node.id
}