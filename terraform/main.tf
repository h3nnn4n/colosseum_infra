terraform {
  # https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.27.2"
    }
  }

  # https://www.terraform.io/language/settings/backends/s3
  backend "s3" {
    bucket = "colosseum-terraform-state"
    key    = "infra"
    region = "us-east-1"
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server
resource "hcloud_server" "colosseum-worker" {
  count       = var.colosseum_worker_count
  name        = "colosseum-worker-${count.index}"
  image       = var.base_image
  server_type = var.colosseum_worker_type
  location    = "ash"

  firewall_ids = [
    hcloud_firewall.ssh_and_ping.id,
    hcloud_firewall.http_and_https.id
  ]

  ssh_keys    = [
    data.hcloud_ssh_key.personal_laptop.id,
    data.hcloud_ssh_key.personal_desktop.id
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
    hcloud_firewall.http_and_https.id
  ]

  ssh_keys    = [
    data.hcloud_ssh_key.personal_laptop.id,
    data.hcloud_ssh_key.personal_desktop.id
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
    hcloud_firewall.http_and_https.id
  ]

  ssh_keys    = [
    data.hcloud_ssh_key.personal_laptop.id,
    data.hcloud_ssh_key.personal_desktop.id
  ]

  labels = {
    type = "web-worker"
  }
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall
resource "hcloud_firewall" "ssh_and_ping" {
  name = "ssh_and_ping"

  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall
resource "hcloud_firewall" "http_and_https" {
  name = "http_and_https"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/ssh_key
data "hcloud_ssh_key" "personal_laptop" {
  fingerprint = "e3:9e:fd:8c:08:38:76:40:59:00:42:4b:98:ce:b7:66"
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/ssh_key
data "hcloud_ssh_key" "personal_desktop" {
  fingerprint = "fc:25:c6:ef:cd:1e:19:d7:e0:9c:25:fa:17:45:39:b3"
}
