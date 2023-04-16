###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

# output to be used in ./main.tf
# displays the dns names for load balancer in VPC blue and VPC green
output "alb_blue_dns_name" {
  description = "DNS name of load balancer for VPC blue"
  value       = aws_lb.LB-JQ-Blue.dns_name
}

output "alb_green_dns_name" {
  description = "DNS name of load balancer for VPC green"
  value       = aws_lb.LB-JQ-Green.dns_name
}
