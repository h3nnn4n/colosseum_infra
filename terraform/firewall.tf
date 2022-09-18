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

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall
resource "hcloud_firewall" "node_exporter" {
  name = "node_exporter"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "9100"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall
resource "hcloud_firewall" "nginx_exporter" {
  name = "nginx_exporter"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "9113"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall
resource "hcloud_firewall" "redis" {
  name = "redis"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "6379"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall
resource "hcloud_firewall" "postgres" {
  name = "postgres"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "5432"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}
