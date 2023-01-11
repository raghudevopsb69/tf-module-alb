output "load_balancers" {
  value = aws_lb.alb.*.arn
}

