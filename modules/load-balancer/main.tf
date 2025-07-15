# Application Load Balancer
resource "aws_lb" "jenkins_terra_infra_alb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_security_group]
  subnets            = var.lb_subnets

  tags = {
    Name = "jenkins_terra_infra_alb"
  }
}

# Listener
resource "aws_lb_listener" "jenkins_listener" {
  load_balancer_arn = aws_lb.jenkins_terra_infra_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_terra_infra_lb_target_group.arn
  }
}
