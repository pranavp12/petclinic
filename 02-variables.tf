variable "aws_region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {
  default = "172.20.0.0/16"
}

variable "private_subnet_cidr" {
  default = "172.20.20.0/24"
}

variable "public_subnet_cidr" {
  default = "172.20.10.0/24"
}

variable "amis" {
  default = {
     us-east-2 = "ami-0520e698dd500b1d1"
     eu-central-1 = "ami-0d4c3eabb9e72650a"
 }
}

variable "aws_key_name" {
   default = "bastion-ee"
}
