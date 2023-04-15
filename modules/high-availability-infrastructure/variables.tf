###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

variable "ami" {
  description = "AMI image"
  default     = "ami-0aa7d40eeae50c9a9"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "min_size" {
  description = "Minimum value for EC2 cluster"
  default     = 2
}

variable "max_size" {
  description = "Maximum value for EC2 cluster"
  default     = 3
}

variable "security_group_id" {
  description = "Security group ID's from security-group/outputs.tf"
  type        = list(any)
}

variable "SN_blue_id" {
    description = "List of Subnet Blue ID's"
    type = list(any)
}

variable "SN_green_id" {
    description = "List of Subnet Green ID's"
    type = list(any)
}

variable "vpc_id" {
  description = "IDs for VPC's"
  type        = list(any)
}

variable "vpc_names" {
  description = "Name for VPC's"
  type        = list(any)
}
