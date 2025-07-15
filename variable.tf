variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "public_subnet_config" {}
variable "private_subnet_config" {}
variable "availability_zone" {}

variable "ami" {}
variable "instance_type" {}
# variable "public_key" {}
variable "instance_name" {}
