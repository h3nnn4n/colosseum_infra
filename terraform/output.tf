output "colosseum-worker-ips" {
  value = {
    for server in hcloud_server.colosseum-worker :
    server.name => server.ipv4_address
  }
}

output "celery-worker-ips" {
  value = {
    for server in hcloud_server.celery-worker :
    server.name => server.ipv4_address
  }
}

output "web-worker-ips" {
  value = {
    for server in hcloud_server.web-worker :
    server.name => server.ipv4_address
  }
}
