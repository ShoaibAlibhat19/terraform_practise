variable "aws_region" {
  description = "The region in which to create the infrastructure"
  type        = string
  nullable    = false
  default     = "us-east-1" #here we need to define either us-west-1 or eu-west-2 if i give other region will get error 
  validation {
    condition = var.aws_region == "us-east-1" || var.aws_region == "ap-south-1"
    error_message = "The variable 'aws_region' must be one of the following regions: us-east-1, ap-south-1"
  }
}


#  if after run this will get error like The variable 'aws_region' must be one of the following regions: us-west-2,│ eu-west-1, so it will allow any one region defined above in conditin block



# Example-2
variable "create_bucket" {
  type    = bool
  default = true
}

# Example-3
variable "environment" {
  type    = string
  default = "test"
}
