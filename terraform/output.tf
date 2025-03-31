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

output "staging-ip" {
  value = {
    for server in hcloud_server.staging_worker :
    server.name => server.ipv4_address
  }
}

output "database-ip" {
  value = hcloud_server.postgres.ipv4_address
}

output "metrics-ip" {
  value = hcloud_server.metrics.ipv4_address
}

output "route53_zone_id" {
  value       = data.aws_route53_zone.colosseum_website.zone_id
  description = "The Route53 zone ID for colosseum.website"
}

output "main_domain" {
  value       = aws_route53_record.main.fqdn
  description = "The fully qualified domain name for the main website"
}

output "api_domain" {
  value       = aws_route53_record.api.fqdn
  description = "The fully qualified domain name for the API"
}

output "db_domain" {
  value       = aws_route53_record.db.fqdn
  description = "The fully qualified domain name for the database"
}

output "celery_domain" {
  value       = aws_route53_record.db.fqdn
  description = "The fully qualified domain name for the celery server"
}

output "worker_domain" {
  value       = aws_route53_record.db.fqdn
  description = "The fully qualified domain name for the worker server"
}

output "staging_domain" {
  value       = aws_route53_record.staging.fqdn
  description = "The fully qualified domain name for the staging environment"
}

output "metrics_domain" {
  value       = aws_route53_record.metrics.fqdn
  description = "The fully qualified domain name for the metrics database"
}
