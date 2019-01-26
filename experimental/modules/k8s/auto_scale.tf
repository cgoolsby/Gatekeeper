resource "aws_autoscaling_group" "demo" {
  desired_capacity     = "${var.num_EKS_nodes_desired}"
  launch_configuration = "${aws_launch_configuration.demo.id}"
  max_size             = "${var.num_EKS_nodes_max}"
  min_size             = "${var.num_EKS_nodes_min}"
  name                 = "${var.EKS_name}"
  vpc_zone_identifier  = ["${var.EKS_Subnet_list[*]}"]

  tag {
    key                 = "Name"
    value               = "${var.EKS_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }
}

