resource "aws_security_group" "sg_pub" {
    vpc_id =  "${aws_vpc.ee-vpc.id}"
    name_prefix = "petclinic-"
    lifecycle {
    create_before_destroy = true
  }

    tags = {
        Name = "Public Subnet SG"
    }
}

resource "aws_security_group" "sg_pvt" {
    vpc_id =  "${aws_vpc.ee-vpc.id}"
    name_prefix = "petclinic-"
    lifecycle {
    create_before_destroy = true
  }

    tags = {
        Name = "Private Subnet SG"
    }
}

resource "aws_security_group_rule" "jenkins_server_from_source_ingress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.sg_pub.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "ssh to jenkins_server"
}

# web
resource "aws_security_group_rule" "jenkins_server_from_source_ingress_webui" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = "${aws_security_group.sg_pub.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "jenkins server web"
}

resource "aws_security_group_rule" "jenkins_server_from_source_ingress_9090" {
  type              = "ingress"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  security_group_id = "${aws_security_group.sg_pub.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "jenkins server web"
}

resource "aws_security_group_rule" "jenkins_server_to_other_machines_ssh" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.sg_pub.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "allow jenkins servers to ssh to other machines"
}

resource "aws_security_group_rule" "jenkins_server_outbound_all_80" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.sg_pub.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "allow jenkins servers for outbound yum"
}

resource "aws_security_group_rule" "jenkins_server_outbound_all_443" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.sg_pub.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "allow jenkins servers for outbound yum"
}

resource "aws_security_group_rule" "pub_pvt" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.sg_pvt.id}"
  cidr_blocks       = ["${var.public_subnet_cidr}"]
  description       = "allow jenkins servers for outbound yum"
}

resource "aws_security_group_rule" "pvt_subnet_outbound_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.sg_pvt.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "allow all outbound traffic from private subnet"
}
resource "aws_security_group_rule" "pub_subnet_outbound_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.sg_pub.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "allow all outbound traffic from private subnet"
}
