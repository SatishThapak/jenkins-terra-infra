variable "ami" {}
variable "instance_type" {}
variable "instance_name" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "enable_public_ip_address" {}
variable "user_data_install_jenkins" {}
variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs to associate with the Jenkins instance"
}
