variable "environment_names" {
  type = list(string)
  default = ["dev", "prod"]
}



resource "aws_instance" "name" {
    ami = "ami-0d27e0fb3bac4d724"
    instance_type = "t2.medium"
    count=length(var.environment_names)
    tags = {
        Name = var.environment_names[count.index]
    }

  
}