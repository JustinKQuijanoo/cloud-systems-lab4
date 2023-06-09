###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

module "vpc" {
  source             = "./modules/vpc"
  aws_region         = "us-east-1"
  vpc_names          = ["VPC-blue", "VPC-green"]
  vpc_cidrs          = ["100.64.0.0/16", "192.168.0.0/16"]
  sn_blue_cidrs      = ["100.64.0.0/24", "100.64.1.0/24", "100.64.2.0/24"]
  sn_green_cidrs     = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "security-group" {
  source    = "./modules/security-group"
  vpc_id    = module.vpc.vpc_id
  vpc_names = module.vpc.vpc_names
}

module "high-availability-infrastructure" {
  source            = "./modules/high-availability-infrastructure"
  security_group_id = module.security-group.security_group_id
  SN_blue_id        = module.vpc.SN_blue_id
  SN_green_id       = module.vpc.SN_green_id
  vpc_id            = module.vpc.vpc_id
  vpc_names         = module.vpc.vpc_names
}

output "alb_blue_dns_name" {
  value = "http://${module.high-availability-infrastructure.alb_blue_dns_name}"
}

output "alb_green_dns_name" {
  value = "http://${module.high-availability-infrastructure.alb_green_dns_name}"
}
