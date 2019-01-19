resource "aws_route_table" "public-rt" {
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.igw_id}"
  }
  tags {
    Name = "${terraform.workspace}-public-rt"
  }
}
resource "aws_route_table" "private-rt" {
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "${terraform.workspace}-private-rt"
  }
}
