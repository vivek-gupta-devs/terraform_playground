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

resource "aws_instance" "add_server_instance" {
  ami = "ami-0fa71268a899c2733"
  instance_type = "t3.nano"
  tags = {
    Name = "feed_server"
  }
}