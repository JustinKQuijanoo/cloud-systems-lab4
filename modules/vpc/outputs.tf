###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

output "vpc_id" {
  description = "VPC ID's"
  value       = aws_vpc.VPC-JQ[*].id
}

output "vpc_names" {
  description = "Name of VPC's"
  value       = var.vpc_names
}
