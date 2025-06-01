terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

// With help ec2 config list
/**
resource "aws_instance" "main" {
  count = length(var.ec2_config)
  ami =  var.ec2_config[count.index].ami
  instance_type = var.ec2_config[count.index].instance_type
    tags = {
      Name = ""
    }
}

*/


locals {
  project = "project-01"
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.project}-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  count      = 2
  tags = {
    Name = "${local.project}-subnet-${count.index}"
  }
}

#Creating 4EC2 instance
resource "aws_instance" "main" {
  
  for_each = var.ec2_map
  # We will get each.key and each.value

  ami           = each.value.ami
  instance_type = each.value.instance_type

  subnet_id = element(aws_subnet.main[*].id, index(keys(var.ec2_map), each.key) % length(aws_subnet.main))

  tags = {
    Name = "${local.project}-instance-${each.key}"
  }
}

output "aws_subnet_id" {
  value = aws_subnet.main[0].id
}