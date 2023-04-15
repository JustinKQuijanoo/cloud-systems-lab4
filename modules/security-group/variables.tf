###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

variable "vpc_id" {
  description = "IDs for VPC's"
  type        = list(any)
}

variable "vpc_names" {
  description = "Name for VPC's"
  type        = list(any)
}
