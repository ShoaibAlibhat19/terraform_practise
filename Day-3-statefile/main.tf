resource "aws_instance" "ec2" {
    ami = var.ami_id
    instance_type = "t2.medium"
    tags = {
      "Name" = "My-ec2"
    }

}