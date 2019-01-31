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
resource "aws_default_route_table" "public-rt" {
  default_route_table_id = "${aws_route_table.public-rt.id}"
}


resource "aws_route_table" "private-rt" {
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.igw_id}"           ####### Not sure if this would be a security hole
  }
  tags {
    Name = "${terraform.workspace}-private-rt"
  }
}
resource "aws_default_route_table" "private-rt" {
  default_route_table_id = "${aws_route_table.private-rt.id}"
}

resource "aws_route_table_association" "public-rt" {
  count = 2 #"${length(var.Public_Subnet_id_list)}"
  subnet_id = "${var.Public_Subnet_id_list[count.index]}"
  route_table_id = "${aws_default_route_table.public-rt.id}"
}

resource "aws_route_table_association" "private-rt" {
  count = 2 #"${length(var.Private_Subnet_id_list)}"
  subnet_id = "${var.Private_Subnet_id_list[count.index]}"
  route_table_id = "${aws_default_route_table.private-rt.id}"
}
resource "aws_route" "public-to-gateway" {
  route_table_id = "${aws_default_route_table.public-rt.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${var.igw_id}"
}
