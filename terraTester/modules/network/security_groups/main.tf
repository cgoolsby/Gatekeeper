resource "aws_security_group" "ssh_in_out" {
  vpc_id = "${var.vpc_id}"
  name = "${terraform.workspace}-ssh_in_out"
}
resource "aws_security_group" "http_in_out" {
  vpc_id = "${var.vpc_id}"
  name = "${terraform.workspace}-http_in_out"
}
resource "aws_security_group" "https_in_out" {
  vpc_id = "${var.vpc_id}"
  name = "${terraform.workspace}-https_in_out"
}
resource "aws_security_group_rule" "ssh_in" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ssh_in_out.id}"
}
resource "aws_security_group_rule" "ssh_out" {
  type = "egress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ssh_in_out.id}"
}

resource "aws_security_group_rule" "http_in" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.http_in_out.id}"
}
resource "aws_security_group_rule" "http_out" {
  type = "egress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.http_in_out.id}"
}

resource "aws_security_group_rule" "https_in" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.https_in_out.id}"
}
resource "aws_security_group_rule" "https_out" {
  type = "egress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.https_in_out.id}"
}
