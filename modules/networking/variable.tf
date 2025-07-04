
variable "availability_zone" {}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}
variable "public_subnet_config" {
  
}
variable "private_subnet_config" {
  
}