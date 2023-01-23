resource "aws_security_group" "allow_alb" {
  name        = "${var.env}_allow_alb_${var.name}"
  description = "Allow ALB Access"
  vpc_id      = local.vpc_id

  ingress {
    description = "HTTP"
    from_port   = local.app_port
    to_port     = local.app_port
    protocol    = "tcp"
    cidr_blocks = local.allow_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}_allow_alb_${var.name}"
  }
}


