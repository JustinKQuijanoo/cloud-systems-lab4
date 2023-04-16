output "alb_blue_dns_name" {
  description = "DNS name of load balancer for VPC blue"
  value       = aws_lb.LB-JQ-Blue.dns_name
}

output "alb_green_dns_name" {
  description = "DNS name of load balancer for VPC green"
  value       = aws_lb.LB-JQ-Green.dns_name
}
