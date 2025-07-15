output "aws_lb_dns_name" {
  value = aws_lb.jenkins_terra_infra_alb.dns_name
}

output "aws_lb_zone_id" {
  value = aws_lb.jenkins_terra_infra_alb.zone_id
}
