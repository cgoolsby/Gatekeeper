output "region" {
  value = "${var.region}"
}
output "cluster_name" {
  value = "${var.k8s_cluster}"
}


output "rds_address" {
  value = "${aws_db_instance.rds.address}"
}

output "public_subnets_id" {
  value = ["${aws_subnet.public_subnet.*.id}"]
}

output "private_subnets_id" {
  value = ["${aws_subnet.private_subnet.*.id}"]
}


