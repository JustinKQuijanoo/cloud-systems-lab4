###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

# Create launching configuration
resource "aws_launch_configuration" "Cluster-JQ" {
  count           = length(var.security_group_id)
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [var.security_group_id[count.index]]
  user_data       = file("./scripts/user-data.sh")
  lifecycle {
    create_before_destroy = true
  }
}

# Create autoscaling group
resource "aws_autoscaling_group" "ASG-JQ" {
  count                = var.min_size
  launch_configuration = aws_launch_configuration.Cluster-JQ[count.index].name
  vpc_zone_identifier  = [var.SN_blue_id, var.SN_green_id]
  min_size             = var.min_size
  max_size             = var.max_size
}
