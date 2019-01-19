resource "aws_route_table" "public-rt" {
  vpc_id = "${var.vpc_id}"
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.igw_id}"
  }
  tags {
    KubernetesCluster = "${bar.k8s_cluster}"
    name = "${terraform.workspace}"
    environment = "${terraform.workspace}"
  }
}
resource "aws_route_table" "private-rt" {
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "${terraform.workspace}-private-rt"
    environment = "${terraform.workspace}"
    type = "public"
  }
}
