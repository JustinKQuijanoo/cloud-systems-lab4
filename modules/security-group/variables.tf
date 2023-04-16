###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

# variables from ./modules/vpc/outputs.tf
# to be used for aws_security_group resource
variable "vpc_id" {
  description = "IDs for VPC's"
  type        = list(any)
}

variable "vpc_names" {
  description = "Name for VPC's"
  type        = list(any)
}
