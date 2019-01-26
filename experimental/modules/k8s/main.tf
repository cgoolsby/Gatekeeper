resource "aws_eks_cluster" "EKS" {
  name = "${var.cluster-name}"
  role_arn = "${aws_iam_role.EKS-cluster.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.EKS-cluster.id}"
    subnet_ids = ["${aws_subnet.EKS*.id}"]                       #TD
  }

  depends_on = [
    "aws_iam_role_policy_attachment.EKS-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.EKS-cluster-AmazonEKSServicePolicy",
  ]
}
