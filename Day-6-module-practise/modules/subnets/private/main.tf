# Private Web Subnets

resource "aws_subnet" "web1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.availability_zone_1a

  tags = {
    Name = "${var.vpc_name}-private-web-1"
    Type = "Private"
    Tier = "Web"
  }
}

resource "aws_subnet" "web2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.availability_zone_1b

  tags = {
    Name = "${var.vpc_name}-private-web-2"
    Type = "Private"
    Tier = "Web"
  }
}

# Private App Subnets

resource "aws_subnet" "app1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_3_cidr
  availability_zone = var.availability_zone_1a

  tags = {
    Name = "${var.vpc_name}-private-app-1"
    Type = "Private"
    Tier = "App"
  }
}

resource "aws_subnet" "app2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_4_cidr
  availability_zone = var.availability_zone_1b

  tags = {
    Name = "${var.vpc_name}-private-app-2"
    Type = "Private"
    Tier = "App"
  }
}

# Private Database Subnets

resource "aws_subnet" "db1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_5_cidr
  availability_zone = var.availability_zone_1a

  tags = {
    Name = "${var.vpc_name}-private-db-1"
    Type = "Private"
    Tier = "Database"
  }
}

resource "aws_subnet" "db2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_6_cidr
  availability_zone = var.availability_zone_1b

  tags = {
    Name = "${var.vpc_name}-private-db-2"
    Type = "Private"
    Tier = "Database"
  }
}