###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "vpc_names" {
  description = "List of VPC names"
  type        = list(any)
  default     = ["VPC-blue", "VPC-green"]
}

variable "vpc_cidrs" {
  description = "List of CIDR blocks for VPC"
  type        = list(any)
  default     = ["100.64.0.0/16", "192.168.0.0/16"]
}

variable "sn_blue_cidrs" {
  description = "Subnet cidrs for VPC blue"
  type        = list(any)
  default     = ["100.64.0.0/24", "100.64.1.0/24", "100.64.2.0/24"]
}

variable "sn_green_cidrs" {
  description = "Subnet cidrs for VPC green"
  type        = list(any)
  default     = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
}

variable "availability_zones" {
  description = "List of AZ's"
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "default_route" {
  description = "Default route"
  type        = string
  default     = "0.0.0.0/0"
}
