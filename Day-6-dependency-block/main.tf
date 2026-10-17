resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "dependency-vpc"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "shoaib-terraform-dependency-practice-2026"

  depends_on = [aws_vpc.my_vpc]
}