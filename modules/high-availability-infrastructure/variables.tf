###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

# default AMI image
variable "ami" {
  description = "AMI image"
  default     = "ami-0aa7d40eeae50c9a9"
}

# default instance type
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

# minimum size for autoscaling group
variable "min_size" {
  description = "Minimum value for EC2 cluster"
  default     = 2
}

# maximum size for autoscaling group
variable "max_size" {
  description = "Maximum value for EC2 cluster"
  default     = 3
}

# variable from ./modules/security-group/outputs.tf
# used for aws_launch_configuration and aws_lb resources
variable "security_group_id" {
  description = "Security group ID's from security-group/outputs.tf"
  type        = list(any)
}

# variables from ./modules/vpc/outputs.tf
# used for aws_autoscaling_group, aws_lb and aws_lb_target_group resources
variable "SN_blue_id" {
  description = "List of Subnet Blue ID's"
  type        = list(any)
}

variable "SN_green_id" {
  description = "List of Subnet Green ID's"
  type        = list(any)
}

variable "vpc_id" {
  description = "IDs for VPC's"
  type        = list(any)
}

variable "vpc_names" {
  description = "Name for VPC's"
  type        = list(any)
}
