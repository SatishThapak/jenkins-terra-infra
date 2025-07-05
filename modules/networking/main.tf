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

# Setup Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
    tags = {
    Name = "jenkins-terra-igw"
  }
}

# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id     = aws_vpc.vpc.id
  route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

    tags = {
    Name = "jenkis-terra-public_route_table"
  }
}

# Public Route Table and public Subnet Association
resource "aws_route_table_association" "public_assoc" {
  for_each       = aws_subnet.public_subnet_config
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table.id
}

# Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  
    tags = {
    Name = "jenkis-terra-private_route_table"
  }
}

# Private Route Table and private Subnet Association
resource "aws_route_table_association" "private_assoc" {
  for_each       = aws_subnet.private_subnet_config
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route_table.id
}