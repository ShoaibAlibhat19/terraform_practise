resource "aws_vpc" "custom_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name"="custom_vpc"
    }
}
resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
      "Name"="subnet-1"
    }
  
}
resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.custom_vpc.id
    tags = {
      "Name"="my_igw"
    }
  
}
resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.custom_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
  
}
resource "aws_route_table_association" "route-1" {
    subnet_id = aws_subnet.subnet_1.id
    route_table_id = aws_route_table.public_route.id

  
}

resource "aws_security_group" "pubic_sg" {
    name        = "public_sg"
    description = "Allow SSH and HTTP traffic"
    vpc_id      = aws_vpc.custom_vpc.id
    
    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0 
        to_port     = 0 
        protocol    = "-1" 
        cidr_blocks = ["0.0.0.0/0"] 
    }
}
resource "aws_instance" "my-ec2" {
    ami = "ami-0d27e0fb3bac4d724"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    subnet_id = aws_subnet.subnet_1.id
    vpc_security_group_ids = [aws_security_group.pubic_sg.id]
  
}