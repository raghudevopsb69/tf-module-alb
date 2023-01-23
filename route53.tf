resource "aws_route53_record" "www" {
  count   = var.name == "public-alb" ? 1 : 0
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "www.devopsb69.online"
  type    = "CNAME"
  ttl     = 30
  records = [aws_lb.alb.dns_name]
}

