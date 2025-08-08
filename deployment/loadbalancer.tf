# loadbalancer.tf

resource "hcloud_load_balancer" "lb" {
  name               = "${var.cluster_name}-lb"
  load_balancer_type = "lb11"
  location           = var.location
}

resource "hcloud_load_balancer_network" "lbnetwork" {
  load_balancer_id = hcloud_load_balancer.lb.id
  subnet_id        = hcloud_network_subnet.private_subnet.id
  depends_on = [
    hcloud_network_subnet.private_subnet,
    hcloud_load_balancer.lb
  ]
}

resource "hcloud_load_balancer_target" "lb_target_master" {
  type             = "server"
  load_balancer_id = hcloud_load_balancer.lb.id
  server_id        = module.k3s_master.id
  depends_on = [
    hcloud_load_balancer.lb,
    module.k3s_master
  ]
}

resource "hcloud_load_balancer_service" "lb_service" {
  load_balancer_id = hcloud_load_balancer.lb.id
  protocol         = "tcp"
  listen_port      = 443
  destination_port = 443
  health_check {
    protocol = "tcp"
    port     = 443
    interval = 10
    retries  = 5
    timeout  = 5
  }
}