module "networking" {
  source                = "./modules/networking"
  cidr_block            = var.cidr_block
  vpc_name              = var.vpc_name
  public_subnet_config  = var.public_subnet_config
  private_subnet_config = var.private_subnet_config
  availability_zone     = var.availability_zone
}

module "security_group" {
  source      = "./modules/securtiy-groups"
  vpc_id      = module.networking.vpc_id
  name        = "jenkins-sg"
  description = "Allow SSH and Jenkins HTTP access"
}


module "jenkins_instance" {
  source        = "./modules/jenkins_instance"
  vpc_id        = module.networking.vpc_id
  ami           = var.ami
  instance_name = var.instance_name
  instance_type = var.instance_type
  subnet_id     = module.networking.public_subnet_ids[0]
  enable_public_ip_address  = true
  user_data_install_jenkins = templatefile("./modules/jenkins_instance/jenkins-installer.sh", {})
  security_group_id        = [module.security_group.security_group_id]
}


module "lb_target_group" {
  source                   = "./modules/load-balancer-target group"
  lb_target_group_name     = var.lb_target_group_name
  lb_target_group_port     = 8080
  lb_target_group_protocol = "HTTP"
  vpc_id                   = module.networking.vpc_id
  jenkins_instance_id      = module.jenkins_instance.jenkins_instance_id
}

