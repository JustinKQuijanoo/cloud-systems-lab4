###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

# Create VPC blocks
resource "aws_vpc" "VPC-JQ" {
  count                = length(var.vpc_names)
  cidr_block           = var.vpc_cidrs[count.index]
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_names[count.index]}"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "IGW-JQ" {
  count  = length(var.vpc_names)
  vpc_id = aws_vpc.VPC-JQ[count.index].id
  tags = {
    Name = "IGW-${var.vpc_names[count.index]}"
  }
}

# Create subnets for VPC-blue
resource "aws_subnet" "SN-Blue" {
  count                   = length(var.sn_blue_cidrs)
  vpc_id                  = aws_vpc.VPC-JQ[0].id
  cidr_block              = var.sn_blue_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "SN-Blue-${count.index + 1}"
  }
}

# Create subnets for VPC-green
resource "aws_subnet" "SN-Green" {
  count                   = length(var.sn_green_cidrs)
  vpc_id                  = aws_vpc.VPC-JQ[1].id
  cidr_block              = var.sn_green_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "SN-Green-${count.index + 1}"
  }
}

# Create route table
resource "aws_route_table" "RTB-JQ" {
  count  = length(var.vpc_names)
  vpc_id = aws_vpc.VPC-JQ[count.index].id
  route {
    cidr_block = var.default_route
    gateway_id = aws_internet_gateway.IGW-JQ[count.index].id
  }
  tags = {
    Name = "RTB-${var.vpc_names[count.index]}"
  }
}

# Associate route table to VPC-Blue subnets
resource "aws_route_table_association" "Blue-access" {
  count          = length(var.sn_blue_cidrs)
  subnet_id      = element(aws_subnet.SN-Blue.*.id, count.index)
  route_table_id = element(aws_route_table.RTB-JQ.*.id, 0)
}

# Associate route table to VPC-Green subnets
resource "aws_route_table_association" "Green-access" {
  count          = length(var.sn_green_cidrs)
  subnet_id      = element(aws_subnet.SN-Green.*.id, count.index)
  route_table_id = element(aws_route_table.RTB-JQ.*.id, 1)
}
