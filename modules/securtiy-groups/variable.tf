variable "vpc_id" {
  type = string
}

variable "name" {
  type        = string
  description = "Name tag and resource name for the security group"
}

variable "description" {
  type        = string
  description = "Description for the security group"
  default     = "Allow SSH and Jenkins HTTP access"
}
