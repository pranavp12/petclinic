resource "aws_instance" "aws_ins_pub" {
    ami = "${lookup(var.amis, var.aws_region)}"
    instance_type = "t2.micro"
   # key_name = "${aws_key_pair.deployer.key_name}"
    key_name = "ee_key"
    vpc_security_group_ids = ["${aws_security_group.sg_pub.id}"]
    subnet_id = "${aws_subnet.public_subnet.id}"
    associate_public_ip_address = true
    user_data = "${file("install.sh")}"
    source_dest_check = false

    tags = {
        Name = "aws-ins-pub"
    }
}
