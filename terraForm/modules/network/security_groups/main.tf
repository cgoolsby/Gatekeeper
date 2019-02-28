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
resource "aws_security_group" "BH_Cluster_Open" {
  description = "Bastion Host and Cluster nodes/master are totally open to each other. i.e. anything in this SG has total access"
  name = "BH-Nodes-Master-Open"
  vpc_id = "${var.vpc_id}"
}
resource "aws_security_group" "node_out" {
  description = "all outbound from node is allowed"
  name = "Node-Out-Open"
  vpc_id = "${var.vpc_id}"
}
resource "aws_security_group_rule" "open_self_in" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  security_group_id = "${aws_security_group.BH_Cluster_Open.id}"
  source_security_group_id = "${aws_security_group.BH_Cluster_Open.id}"
}
resource "aws_security_group_rule" "open_self_out" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  security_group_id = "${aws_security_group.BH_Cluster_Open.id}"
  source_security_group_id = "${aws_security_group.BH_Cluster_Open.id}"
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
resource "aws_security_group_rule" "node_out" {
  description = "allows all outbound from your nodes"
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.node_out.id}"
}
resource "aws_security_group_rule" "http_in8080" {
  type = "ingress"
  from_port = 8080
  to_port = 8080
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
resource "aws_security_group_rule" "http_out8080" {
  type = "egress"
  from_port = 8080
  to_port = 8080
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
