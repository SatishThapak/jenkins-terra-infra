variable "lb_target_group_name" {}
variable "lb_target_group_port" {}
variable "lb_target_group_protocol" {}
variable "vpc_id" {}
variable "lb_name" {}
variable "lb_security_group" {}
variable "lb_subnets" {
  type = list(string)
}