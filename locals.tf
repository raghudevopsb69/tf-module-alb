locals {
  vpc_id           = lookup(lookup(var.vpc, var.env, null), "vpc_id", null)
  app_subnets_cidr = lookup(lookup(var.vpc, var.env, null), "app_subnets_cidr", null)
  app_subnets_ids  = lookup(lookup(var.vpc, var.env, null), "app_subnets_ids", null)

  public_subnets_cidr = lookup(lookup(var.vpc, var.env, null), "public_subnets_cidr", null)
  public_subnets_ids  = lookup(lookup(var.vpc, var.env, null), "public_subnets_ids", null)

  alb_subnets = var.internal ? local.app_subnets_ids : local.public_subnets_ids
  allow_cidr  = var.name == "public-alb" ? ["0.0.0.0/0"] : local.public_subnets_cidr
  app_port    = var.name == "public-alb" ? 443 : 80
}

