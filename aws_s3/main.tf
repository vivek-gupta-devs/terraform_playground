terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "random_string" "name_generator" {
    length = 10
    special = false
    upper = false
}

output "name" {
  value = aws_s3_bucket.create_bucket.bucket
}

resource "aws_s3_bucket" "create_bucket" {
  bucket = "sandbox-${ random_string.name_generator.id}"
}

resource "aws_s3_object" "add_file" {
    bucket = aws_s3_bucket.create_bucket.bucket
    source = "./Sample.txt"
    key = "data_type.txt"
  
}