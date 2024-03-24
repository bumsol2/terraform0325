# Create a VPC
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "fastcampus_default_vpc${var.env}"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.0.0/24"
  availability_zone= local.az_a 

  tags = {
    Name = "fastcampus_public_subnet_1${var.env}"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.100.0/24"
  availability_zone= local.az_a 

  tags = {
    Name = "fastcampus_private_subnet_1${var.env}"
  }
}

resource "aws_nat_gateway" "private_nat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_subnet_1.id
    tags = {
    Name = "fastcampus_nat_${var.env}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id

    tags = {
    Name = "fastcampus_igw_${var.env}"
  }
}





