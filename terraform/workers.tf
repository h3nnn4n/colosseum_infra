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

  ssh_keys = [
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

  ssh_keys = [
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

  ssh_keys = [
    data.hcloud_ssh_key.hekatoncheires.id,
  ]

  labels = {
    type = "web-worker"
  }
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
resource "hcloud_server" "staging_worker" {
  count       = var.staging_count
  name        = "staging-${count.index}"
  image       = var.base_image
  server_type = var.staging_type
  location    = "ash"

  firewall_ids = [
    hcloud_firewall.ssh_and_ping.id,
    hcloud_firewall.http_and_https.id,
    hcloud_firewall.node_exporter.id,
    hcloud_firewall.nginx_exporter.id
  ]

  ssh_keys = [
    data.hcloud_ssh_key.hekatoncheires.id,
  ]

  labels = {
    type = "staging"
  }
}

resource "hcloud_server" "metrics" {
  name        = "metrics"
  image       = var.metrics_image
  server_type = var.metrics_type
  location    = "ash"

  firewall_ids = [
    hcloud_firewall.ssh_and_ping.id,
    hcloud_firewall.influxdb.id,
  ]

  ssh_keys = [
    data.hcloud_ssh_key.hekatoncheires.id,
  ]

  labels = {
    type = "metrics"
  }

  # The server is old and had old ssh keys which were lost. We don't want to
  # recreate the server just to update the ssh keys. It was manually updated.
  lifecycle {
    ignore_changes = [
      ssh_keys,
    ]
  }
}
