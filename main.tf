terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"

}

# Create a VPC
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "fastcampus_public_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.100.0/24"

  tags = {
    Name = "fastcampus_private_subnet_1"
  }
}

# resource "aws_subnet" "private_subnet_2" {
#   vpc_id     = aws_vpc.default.id
#   cidr_block = "10.0.101.0/24"

#   tags = {
#     Name = "fastcampus_private_subnet_1_data"
#   }
# }

data "aws_subnet" "private_subnet_2" {
  id = "subnet-00f79a6ea10c34079"
}



