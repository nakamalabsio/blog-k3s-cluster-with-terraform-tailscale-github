# version.tf

terraform {
  required_version = ">= 1.3.0"
  cloud {
    organization = "nakamalabsio-tutorials"
    workspaces {
      name = "tutorials"
    }
  }
  required_providers {
    # https://registry.terraform.io/providers/hetznercloud/hcloud/latest
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.52.0"
    }
    # https://registry.terraform.io/providers/tailscale/tailscale/latest
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.21.1"
    }
  }
}