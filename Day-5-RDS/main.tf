resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "dev"
    }
  
}

resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "my-subnet"
    }
}

resource "aws_subnet" "subnet-2" {
    vpc_id = aws_vpc.name.id
    availability_zone = "us-east-1b"
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "my-subnet"
    }
}
resource "aws_db_subnet_group" "my_subnet_group" {
  name = "my-subnet-group"

  subnet_ids = [
    aws_subnet.subnet-1.id,
    aws_subnet.subnet-2.id
  ]

  tags = {
    Name = "my-db-subnet-group"
  }
}

resource "aws_security_group" "my_security_group" {
    name        = "my-security-group"
    description = "Allow SSH and HTTP traffic"
    vpc_id      = aws_vpc.name.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 3306
        to_port     = 3306
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



resource "aws_db_instance" "primary" {
    allocated_storage    = 20
    engine               = "mysql"
    engine_version       = "8.0"
    instance_class       = "db.t3.micro"
    identifier           = "mydbinstance"
    username             = "admin"
    password             = "Cloud123" #self managed password
    #managed_master_user_password = true  #enable password management by AWS Secrets Manager
    db_subnet_group_name = aws_db_subnet_group.my_subnet_group.name
    vpc_security_group_ids = [aws_security_group.my_security_group.id]
    #publicly_accessible  = true
    skip_final_snapshot  = true
    maintenance_window    = "Mon:00:00-Mon:03:00"
    backup_retention_period = 7

  
}


resource "aws_db_instance" "replica" {
  identifier = "mydbinstance-replica"
  replicate_source_db = aws_db_instance.primary.identifier
  instance_class = "db.t3.micro"
  publicly_accessible = false
  skip_final_snapshot = true
  vpc_security_group_ids = [
    aws_security_group.my_security_group.id
  ]
}