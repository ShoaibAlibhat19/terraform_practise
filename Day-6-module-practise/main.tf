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

# internet - Gateway 
module "igw" {
  source = "./modules/internetGateway"

  vpc_id   = module.vpc.vpc_id
  igw_name = var.igw_name
}

# Public Route Table
module "public_route_table" {
  source = "./modules/route-table/public-rt"

  vpc_id             = module.vpc.vpc_id
  igw_id             = module.igw.igw_id
  route_table_name   = var.public_route_table_name
  public_subnet_1_id = module.public_subnets.public_subnet_1_id
  public_subnet_2_id = module.public_subnets.public_subnet_2_id
}

module "nat" {
    source = "./modules/natGateway"
    vpc_id = module.vpc.vpc_id
    nat_name = var.nat_name
  
}

module "private_route_table" {
  source = "./modules/route-table/private-rt"

  vpc_id           = module.vpc.vpc_id
  nat_gateway_id   = module.nat.nat_gateway_id
  route_table_name = "project-private-rt"

  private_subnet_ids = [
    module.priavte_subnets.web_subnet_1_id,
    module.priavte_subnets.web_subnet_2_id,
    module.priavte_subnets.app_subnet_1_id,
    module.priavte_subnets.app_subnet_2_id,
    module.priavte_subnets.db_subnet_1_id,
    module.priavte_subnets.db_subnet_2_id
  ]
}


module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
}