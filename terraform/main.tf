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
  image       = "debian-11"
  server_type = "cpx11"
  location    = "ash"

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
  image       = "debian-11"
  server_type = "cpx11"
  location    = "ash"

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
  image       = "debian-11"
  server_type = "cpx11"
  location    = "ash"

  ssh_keys    = [
    data.hcloud_ssh_key.personal_laptop.id,
    data.hcloud_ssh_key.personal_desktop.id
  ]

  labels = {
    type = "web-worker"
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
