resource "aws_subnet" "public" {
  count = 1
  vpc_id = "${var.vpc_id}"
#  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "Public Subnet"
  }
}
