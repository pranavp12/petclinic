resource "aws_internet_gateway" "igw-01" {
    vpc_id = "${aws_vpc.ee-vpc.id}"
    tags = {
        Name = "InternetGateway"
    }
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.ee-vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw-01.id}"
}

resource "aws_eip" "eip-ngw" {
  vpc      = true
  depends_on = ["aws_internet_gateway.igw-01"]
}


resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.eip-ngw.id}"
  subnet_id     = "${aws_subnet.public_subnet.id}"

  depends_on = ["aws_internet_gateway.igw-01"]
  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "private_route_table" {
    vpc_id = "${aws_vpc.ee-vpc.id}"

    tags = {
        Name = "Private route table"
    }
}

resource "aws_route" "private_route" {
	route_table_id  = "${aws_route_table.private_route_table.id}"
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
}

resource "aws_route_table_association" "public_subnet_igw" {
    subnet_id = "${aws_subnet.public_subnet.id}"
    route_table_id = "${aws_vpc.ee-vpc.main_route_table_id}"
}

resource "aws_route_table_association" "pvt_subnet_igw" {
    subnet_id = "${aws_subnet.private_subnet.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

