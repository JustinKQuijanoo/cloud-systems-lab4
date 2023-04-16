###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

# outputs to be used for ./modules/high-availability-infrastructure module
# used for aws_launch_configuration and aws_lb resources
output "security_group_id" {
  description = "ID's for the security groups"
  value       = aws_security_group.SG-JQ[*].id
}
