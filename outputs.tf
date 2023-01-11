output "lb_arn" {
  value = { for k, v in aws_lb.alb : k => v.arn }
}

