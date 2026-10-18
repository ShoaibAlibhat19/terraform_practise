# vpc

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
  
}

# subnets 

# Public Subnet Module

module "public_subnets" {
  source ="./modules/subnets/public"

  vpc_id   = module.vpc.vpc_id
  vpc_name = var.vpc_name

  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr

  availability_zone_1a = var.availability_zone_1a
  availability_zone_1b = var.availability_zone_1b
}

# Private Subnet Module

module "priavte_subnets" {
  source = "./modules/subnets/private"

  vpc_id   = module.vpc.vpc_id
  vpc_name = var.vpc_name

  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  private_subnet_3_cidr = var.private_subnet_3_cidr
  private_subnet_4_cidr = var.private_subnet_4_cidr
  private_subnet_5_cidr = var.private_subnet_5_cidr
  private_subnet_6_cidr = var.private_subnet_6_cidr

  availability_zone_1a = var.availability_zone_1a
  availability_zone_1b = var.availability_zone_1b
}