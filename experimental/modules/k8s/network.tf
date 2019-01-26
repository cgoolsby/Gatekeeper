# This data source is included for ease of sample architecture deployment
# and can be swapped out as necessary.
data "aws_availability_zones" "available" {}

resource "aws_subnet" "EKS" {
  count = 2

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = "${aws_vpc.EKS.id}"

  tags = "${
    map(
     "Name", "terraform-eks-EKS-node",
     "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}


resource "aws_route_table_association" "EKS" {
  count = 2

  subnet_id      = "${var.Public_Subnet_id_list[count.index]}"
  route_table_id = "${aws_route_table.EKS.id}"
}

