# Create a VPC
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "fastcampus_default_vpc${var.env}"
  }
}

resource "aws_subnet" "public_subnet_1" {
  count = var.env == "prd" ? 0 : 1
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.0.0/24"
  availability_zone= local.az_a 

  tags = {
    Name = "fastcampus_public_subnet_1${var.env}"
  }
}

# resource "aws_nat_gateway" "public_nat" {
#   count = var.env == "prd" ? 0 : 1
#   connectivity_type = "public"
#   subnet_id         = aws_subnet.public_subnet_1[0].id
# }

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.100.0/24"
  availability_zone= local.az_a 

  tags = {
    Name = "fastcampus_private_subnet_1${var.env}"
  }
}



