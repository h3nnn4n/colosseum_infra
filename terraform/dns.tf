data "aws_route53_zone" "colosseum_website" {
  name = "colosseum.website."
}

resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.colosseum_website.zone_id
  name    = "colosseum.website"
  type    = "A"
  ttl     = 300
  records = [hcloud_server.web-worker[0].ipv4_address]
}

resource "aws_route53_record" "api" {
  zone_id = data.aws_route53_zone.colosseum_website.zone_id
  name    = "api.colosseum.website"
  type    = "A"
  ttl     = 300
  records = [hcloud_server.web-worker[0].ipv4_address]
}

resource "aws_route53_record" "db" {
  zone_id = data.aws_route53_zone.colosseum_website.zone_id
  name    = "db.colosseum.website"
  type    = "A"
  ttl     = 300
  records = [hcloud_server.postgres.ipv4_address]
}

resource "aws_route53_record" "celery" {
  zone_id = data.aws_route53_zone.colosseum_website.zone_id
  name    = "celery.colosseum.website"
  type    = "A"
  ttl     = 300
  records = [hcloud_server.celery-worker[0].ipv4_address]
}

resource "aws_route53_record" "worker" {
  zone_id = data.aws_route53_zone.colosseum_website.zone_id
  name    = "worker.colosseum.website"
  type    = "A"
  ttl     = 300
  records = [hcloud_server.colosseum-worker[0].ipv4_address]
}

resource "aws_route53_record" "staging" {
  zone_id = data.aws_route53_zone.colosseum_website.zone_id
  name    = "staging.colosseum.website"
  type    = "A"
  ttl     = 300
  records = [hcloud_server.staging_worker[0].ipv4_address]
}

resource "aws_route53_record" "metrics" {
  zone_id = data.aws_route53_zone.colosseum_website.zone_id
  name    = "metrics.colosseum.website"
  type    = "A"
  ttl     = 300
  records = [hcloud_server.metrics.ipv4_address]
}
