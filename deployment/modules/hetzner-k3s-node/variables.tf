# modules/hetzner-k3s-node/variables.tf

variable "name_prefix" {
  type        = string
  description = "Name prefix"
}
variable "server_type" {
  type        = string
  description = "Server type"
}
variable "location" {
  type        = string
  description = "Location"
}
variable "is_master" {
  type        = bool
  description = "Master node k3s"
}
variable "k3s_token" {
  type        = string
  description = "k3s token random string"
}
variable "k3s_master_ip" {
  type        = string
  description = "K3s master ip coming from the TF resource"
}
variable "ssh_public_key" {
  type        = string
  description = "SSH public key"
}
variable "network_id" {
  description = "ID private netowkr Hetzner"
  type        = string
}
variable "tailscale_auth_key" {
  description = "Tailscale Auth Key"
  type        = string
}