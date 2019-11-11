resource "aws_subnet" "public_subnet" {
    vpc_id = "${aws_vpc.ee-vpc.id}"  

    cidr_block = "${var.public_subnet_cidr}" 

    tags = {
        Name = "Public Subnet"
    }
}


resource "aws_subnet" "private_subnet" {
    vpc_id = "${aws_vpc.ee-vpc.id}"

    cidr_block = "${var.private_subnet_cidr}"

    tags = {
        Name = "Private Subnet"
    }
}
