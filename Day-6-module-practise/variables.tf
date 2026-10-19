// vpc varaibles 
variable "vpc_cidr" {
    description = "cidr value for vpc"
    type= string
  
}
variable "vpc_name" {
    description = "Name for vpc"
    type= string
  
}

# subnets

variable "availability_zone_1a" {
  type = string
}

variable "availability_zone_1b" {
  type = string
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}

variable "private_subnet_3_cidr" {
  type = string
}

variable "private_subnet_4_cidr" {
  type = string
}

variable "private_subnet_5_cidr" {
  type = string
}

variable "private_subnet_6_cidr" {
  type = string
}

variable "igw_name" {
    type = string
  
}

variable "public_route_table_name" {
  type = string
}

variable "nat_name" {
    type = string
  
}