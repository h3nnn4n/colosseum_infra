# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
resource "hcloud_server" "postgres" {
  name        = "postgres"
  image       = var.base_image
  server_type = var.database_worker_type
  location    = "ash"

  firewall_ids = [
    hcloud_firewall.ssh_and_ping.id,
    hcloud_firewall.node_exporter.id,
    hcloud_firewall.postgres.id
  ]

  ssh_keys    = [
    data.hcloud_ssh_key.personal_laptop.id,
    data.hcloud_ssh_key.personal_desktop.id
  ]

  labels = {
    type = "database"
  }
}
