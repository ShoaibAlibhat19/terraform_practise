variable "vpc_id" {
  type = string
}

variable "nat_gateway_id" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}