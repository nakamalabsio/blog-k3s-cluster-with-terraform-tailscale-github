# providers.tf

provider "hcloud" {
  token = var.hcloud_token
}

provider "tailscale" {
  api_key = var.tailscale_api_key
  tailnet = var.tailscale_user
}