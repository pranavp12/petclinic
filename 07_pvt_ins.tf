resource "aws_instance" "aws_ins_pvt" {
    ami = "${lookup(var.amis, var.aws_region)}"
    instance_type = "t2.micro"
    key_name = "ee_key"
    vpc_security_group_ids = ["${aws_security_group.sg_pvt.id}"]
    subnet_id = "${aws_subnet.private_subnet.id}"
    associate_public_ip_address = false
    source_dest_check = false

    tags = {
        Name = "aws-ins-pvt"
    }
}
