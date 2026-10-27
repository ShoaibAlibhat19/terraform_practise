provider "aws" {
  region = var.aws_region
 }
resource "aws_s3_bucket" "example" {
  count  = var.create_bucket ? 1 : 0
  bucket = "my-terraform-example-shoaibbhatt"
}
# provider "aws" {
#   region = "us-east-1"
# }

resource "aws_instance" "example" {
  count         = var.environment == "prod" ? 3 : 1
  ami           = "ami-0d27e0fb3bac4d724"
  instance_type = "t2.micro"

  tags = {
    Name = "example-${count.index}"
  }
}

# #In this case:
# #If var.environment == "prod" → count = 3
# #Else (like dev, qa, etc.) → count = 1
# #terraform apply -var="environment=dev"