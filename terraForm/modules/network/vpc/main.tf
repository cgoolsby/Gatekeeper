resource "aws_vpc" "gatekeeper-vpc" {
  cidr_block = "${var.vpc_cidr_block}"
  enable_dns_hostnames = true
}
