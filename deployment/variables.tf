# variables.tf

variable "cluster_name" {
  type        = string
  description = "K3s cluster name"
}

variable "region" {
  type        = string
  description = "Hetzner region"
}

variable "location" {
  type        = string
  description = "Hetzner location"
}

variable "k3s_token" {
  type        = string
  description = "Token para que los workers se unan al master"
}

variable "server_type" {
  type    = string
  default = "cax11"
}

variable "hcloud_token" {
  type        = string
  description = "Token para Hetzner Cloud"
}

variable "name_prefix" {
  type        = string
  description = "SSH name prefix for Hetzner"
}

variable "tailscale_auth_key" {
  description = "Tailscale Auth Key"
  type        = string
}

variable "tailscale_api_key" {
  description = "Tailscale API Key"
  type        = string
}

variable "tailscale_user" {
  description = "Tailscale User"
  type        = string
}

variable "hcloud_ssh_key" {
  description = "HCloud SSH Key"
  type        = string
}