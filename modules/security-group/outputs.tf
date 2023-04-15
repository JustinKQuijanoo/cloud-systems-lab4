###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

output "security_group_id" {
  description = "ID's for the security groups"
  value       = aws_security_group.SG-JQ[*].id
}
