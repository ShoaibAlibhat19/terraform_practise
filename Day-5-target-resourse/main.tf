resource "aws_instance" "ec2" {
    ami = "ami-0d27e0fb3bac4d724"
    instance_type = "t2.medium"
    tags = {
      "Name" = "My-ec2"
    }
}
resource "aws_s3_bucket" "mybucket" {
  bucket = "shoaib-terraformbucketqwerty"      // will target only s3 bucket here 
  
}
