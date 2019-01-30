resource "aws_eks_cluster" "EKS" {
  name            = "${var.cluster-name}"
  role_arn        = "${aws_iam_role.EKS-cluster.arn}"

  vpc_config {
    security_group_ids = ["${var.sg-BH_Cluster_Open_id}", '${var.sg-ssh_id}"]
    subnet_ids         = ["${var.EKS_Subnet_list}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.EKS-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.EKS-cluster-AmazonEKSServicePolicy",
  ]
}

