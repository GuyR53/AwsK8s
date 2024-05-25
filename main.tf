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
  env                  = var.env
  private_subnet_ids   = module.vpc.private_subnet_ids 
  security_group_ids   = module.vpc.security_group_ids
  eks_name             = var.eks_name
  node_groups          = var.node_groups
  eks_version          = var.eks_version
  enable_irsa          = var.enable_irsa
}

# Create keda module (for keda role)
module "keda" {
  source               = "./modules/keda"
  oidc_provider_arn   = module.eks.oidc_provider_arn
  oidc_provider_url   = module.eks.oidc_provider_url

}

# Create sqs module
module "sqs" {
  source               = "./modules/sqs"
  env                  = var.env
}