data "aws_availability_zones" "available" {}
resource "aws_subnet" "public" {
  count = 2
  vpc_id = "${var.vpc_id}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private" {
  count = 2
  vpc_id = "${var.vpc_id}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block = "10.0.1${count.index}.0/24"
  map_public_ip_on_launch = false
  tags {
    Name = "Private Subnet"
  }
}
resource "aws_eip" "nat_eip" {
  vpc = true
}
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id = "${aws_subnet.private.id}"
}
