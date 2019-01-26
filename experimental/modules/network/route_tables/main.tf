resource "aws_default_route_table" "public-rt" {
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.igw_id}"
  }
  tags {
    Name = "${terraform.workspace}-public-rt"
  }
}
#resource "aws_route_table" "private-rt" {
#  vpc_id = "${var.vpc_id}"
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = "${var.igw_id}"           ####### Not sure if this would be a security hole
#  }
#  tags {
#    Name = "${terraform.workspace}-public-rt"
#  }
#}
resource "aws_main_route_table_association" "public-rt" {
  count = "${length(var.Public_Subnet_list)}"
  subnet_id = "${var.Public_Subnet_list[count.index]}"
  vpc_id = "${var.vpc_id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}

#resource "aws_route_table" "private-rt" {
#  count = 2
#  vpc_id = "${var.vpc_id}"
#  route_table_id = "${aws_route_tables.private-rt.id}"
#  tags {
#    Name = "${terraform.workspace}-private-rt"
#  }
#}
