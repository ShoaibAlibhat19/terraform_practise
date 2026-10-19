output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}

output "nat_public_ips" {
  value = aws_nat_gateway.nat.regional_nat_gateway_address[*].public_ip
}