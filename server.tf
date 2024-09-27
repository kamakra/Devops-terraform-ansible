terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-037774efca2da0726"
  instance_type = "t2.micro"
  key_name = "kkv-import"

  tags = {
    Name = "kkv-DevOps-batch-server"
    env = "Production"
    owner = "kkv"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

