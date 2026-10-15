resource "aws_instance" "ec2" {
    ami = "ami-0d27e0fb3bac4d724"
    # ami = "ami-0d27e0fb3bac4d72434" # changed ami to check life cycle rule create before destroy 
    instance_type = "t2.medium"
    tags = {
      "Name" = "My-ec2"
    }

    lifecycle {
        ignore_changes = [tags]
  }


# lifecycle {
#     create_before_destroy=true
# }

#   lifecycle {
#     # prevent_destroy = true
#     prevent_destroy = false # changed from true to false now able to destroy 
#   }
}