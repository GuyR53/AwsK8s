# Create vpc module
module "vpc" {
  source               = "./modules/vpc"
  env                  = var.env
  azs                  = var.azs
  vpc_cidr_block       = var.vpc_cidr_block
  vpc_name             = var.vpc_name
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
}

# Create eks module
module "eks" {
  source               = "./modules/eks"
  private_subnet_ids   = module.vpc.private_subnet_ids 
}