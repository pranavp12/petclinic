resource "aws_vpc" "ee-vpc" {
    cidr_block = "${var.vpc_cidr}"  
    tags = {
        Name = "ee-terraform-vpc"
    }
}
