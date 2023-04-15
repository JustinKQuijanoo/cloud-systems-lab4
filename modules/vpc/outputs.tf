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

output "SN_blue_id" {
  description = "ID of subnet blue"
  value       = aws_subnet.SN-Blue[*].id
}

output "SN_green_id" {
  description = "ID of subnet green"
  value       = aws_subnet.SN-Green[*].id
}
