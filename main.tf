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
#개발용도#
module "default_custom_vpc" {
  source = "./custom_vpc"
  env = "dev"
}
#운영용도#
module "prod_custom_vpc" {
  source = "./custom_vpc"
  env ="prod"
}


