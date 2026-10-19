resource "aws_nat_gateway" "nat" {
  vpc_id            = var.vpc_id
  availability_mode = "regional"
  connectivity_type = "public"

  tags = {
    Name = var.nat_name
  }
}