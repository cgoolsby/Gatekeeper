resource "aws_internet_gateway" "igw" {
  vpc_id = "${var.vpc_id}"
  tags {
    KubernetesCluster = "${var.k8s_cluster}"
    name = "${terraform.workspace}-igw"
    environment = "${terraform.workspace}"
    "kubernetes.io/cluster/${var.k8s_cluster}" = "owned"
  }
}
