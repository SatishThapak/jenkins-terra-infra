module "networking" {
  source                = "./modules/networking"
  cidr_block = var.cidr_block
  vpc_name              = var.vpc_name
  public_subnet_config  = var.public_subnet_config
  private_subnet_config = var.private_subnet_config
  availability_zone     = var.availability_zone
}