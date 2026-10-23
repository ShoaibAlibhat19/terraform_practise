# output "vpc_id" {
#     description = "ID of the created VPC"
#     value = module.vpc.vpc_id
  
# }

output "hosted_zone_id" {
  value = module.route53.hosted_zone_id
}

output "name_servers" {
  value = module.route53.name_servers
}