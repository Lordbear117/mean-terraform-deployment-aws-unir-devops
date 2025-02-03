# main.tf
provider "aws" {
  region = var.aws_region
}

# Llamada al módulo de red
module "network" {
  source     = "./modules/network"
  cidr_block = var.vpc_cidr_block
}

# Llamada al módulo de seguridad
module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}

# Llamada al módulo de instancias
module "instances" {
  source         = "./modules/instances"
  ami_mean_id    = var.ami_mean_stack_id
  ami_mongo_id   = var.ami_mongodb_id
  public_subnet  = module.network.public_subnet_id  # Subred pública para el frontend
  private_subnet = module.network.private_subnet_id # Subred privada para MongoDB
  mean_sg_id     = module.security.mean_sg_id       # Grupo de seguridad del frontend
  mongo_sg_id    = module.security.mongodb_sg_id    # Grupo de seguridad de MongoDB
}

# Llamada al módulo de balanceador de carga
module "load_balancer" {
  source     = "./modules/load_balancer"
  vpc_id = module.network.vpc_id
  mean_sg_id = module.security.mean_sg_id
  public_subnet  = module.network.public_subnet_id
  secondary_public_subnet  = module.network.secondary_public_subnet_id
  mean_instance_id = module.instances.mean_instance_id
}
