# modules/hetzner-k3s-node/version.tf

terraform {
  required_providers {
    # https://registry.terraform.io/providers/hetznercloud/hcloud/latest
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.52.0"
    }
  }
}