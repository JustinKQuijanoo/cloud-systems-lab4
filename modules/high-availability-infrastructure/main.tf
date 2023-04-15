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
  launch_configuration = aws_launch_configuration.Cluster-JQ[0].name
  vpc_zone_identifier  = var.SN_blue_id
  min_size             = var.min_size
  max_size             = var.max_size
  tag {
    key = "Name"
    value = "WS-JQ"
    propagate_at_launch = true
  }
}

resource "aws_lb" "LB-JQ" {
  count = length(var.vpc_names)
  name = "LB-JQ"
  load_balancer_type = "application"
  subnets = var.SN_blue_id
  security_groups = [var.security_group_id[count.index]]
}

resource "aws_lb_listener" "http" {
  count = length(var.vpc_names)
  load_balancer_arn = aws_lb.LB-JQ[count.index].arn
  port = 80
  protocol = "http"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code = 404
    }
  }
}

resource "aws_lb_target_group" "TG-JQ" {
  count  = length(var.vpc_names)
  name = "TG-JQ"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id[count.index]
  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "Listener-JQ" {
  count = length(var.vpc_names)
  listener_arn = aws_lb_listener.http[count.index].arn
  priority = 100
  condition {
    path_pattern {
      values = ["*"]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.TG-JQ[count.index].arn
  }
}