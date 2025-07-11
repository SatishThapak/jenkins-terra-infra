module "networking" {
  source                = "./modules/networking"
  cidr_block            = var.cidr_block
  vpc_name              = var.vpc_name
  public_subnet_config  = var.public_subnet_config
  private_subnet_config = var.private_subnet_config
  availability_zone     = var.availability_zone
}

module "jenkins_instance" {
  source        = "./modules/jenkins_instance"
  vpc_id        = module.networking.vpc_id
  ami           = var.ami
  instance_name = var.instance_name
  instance_type = var.instance_type
  subnet_id     = module.networking.public_subnet_ids[0]
  enable_public_ip_address = true
}