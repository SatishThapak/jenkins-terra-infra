# Target Group
resource "aws_lb_target_group" "jenkins_terra_infra_lb_target_group" {
  name             = var.lb_target_group_name
  port             = var.lb_target_group_port
  protocol         = var.lb_target_group_protocol
  ip_address_type  = "ipv4"
  vpc_id           = var.vpc_id
  protocol_version = "HTTP1"

  health_check {
    enabled             = true
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = "traffic-port"
    matcher             = "200"
    protocol            = "HTTP"
  }

  tags = {
    Name = "jenkins_terra_infra_lb_target_group"
  }
}

resource "aws_lb_target_group_attachment" "jenkins_terra_infra_lb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.jenkins_terra_infra_lb_target_group.arn
  target_id        = var.jenkins_instance_id
  port             = 8080
}