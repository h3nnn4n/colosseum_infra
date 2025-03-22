# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
resource "hcloud_server" "postgres" {
  name        = "postgres"
  image       = var.base_image
  server_type = var.database_worker_type
  location    = "ash"

  firewall_ids = [
    hcloud_firewall.ssh_and_ping.id,
    hcloud_firewall.node_exporter.id,
    hcloud_firewall.postgres.id,
    hcloud_firewall.redis.id
  ]

  ssh_keys    = [
    data.hcloud_ssh_key.personal_laptop.id,
    data.hcloud_ssh_key.personal_desktop.id,
    data.hcloud_ssh_key.key_1.id,
    data.hcloud_ssh_key.key_2.id
  ]

  labels = {
    type = "database"
  }
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume
resource "hcloud_volume" "postgres_data" {
  name      = var.postgres_volume_name
  size      = var.postgres_volume_size
  server_id = hcloud_server.postgres.id
  automount = true
  format    = "ext4"
  labels = {
    type = "database-storage"
  }
}
