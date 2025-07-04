# Setup VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Setup public subnet
resource "aws_subnet" "public_subnet_config" {
  for_each          = var.public_subnet_config
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "public-subnet-az-${each.value.az}"
  }
}
# Setup private subnet
resource "aws_subnet" "private_subnet_config" {
  for_each = var.private_subnet_config

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "private-subnet-az-${each.value.az}"
  }
}