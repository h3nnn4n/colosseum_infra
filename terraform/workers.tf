# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
resource "hcloud_server" "colosseum-worker" {
  count       = var.colosseum_worker_count
  name        = "colosseum-worker-${count.index}"
  image       = var.base_image
  server_type = var.colosseum_worker_type
  location    = "ash"

  firewall_ids = [
    hcloud_firewall.ssh_and_ping.id,
    hcloud_firewall.node_exporter.id
  ]

  ssh_keys    = [
    data.hcloud_ssh_key.hekatoncheires.id,
  ]

  labels = {
    type = "colosseum-worker"
  }
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
resource "hcloud_server" "celery-worker" {
  count       = var.celery_worker_count
  name        = "celery-worker-${count.index}"
  image       = var.base_image
  server_type = var.celery_worker_type
  location    = "ash"

  firewall_ids = [
    hcloud_firewall.ssh_and_ping.id,
    hcloud_firewall.node_exporter.id
  ]

  ssh_keys    = [
    data.hcloud_ssh_key.hekatoncheires.id,
  ]

  labels = {
    type = "celery-worker"
  }
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
resource "hcloud_server" "web-worker" {
  count       = var.web_worker_count
  name        = "web-worker-${count.index}"
  image       = var.base_image
  server_type = var.web_worker_type
  location    = "ash"

  firewall_ids = [
    hcloud_firewall.ssh_and_ping.id,
    hcloud_firewall.http_and_https.id,
    hcloud_firewall.node_exporter.id,
    hcloud_firewall.nginx_exporter.id
  ]

  ssh_keys    = [
    data.hcloud_ssh_key.hekatoncheires.id,
  ]

  labels = {
    type = "web-worker"
  }
}
