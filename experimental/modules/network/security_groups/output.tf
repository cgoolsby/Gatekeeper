output "sg-ssh_id" {
  value = "${aws_security_group.ssh_in_out.id}"
} #makes security groups build before webservers
output "sg-http_id" {
  value = "${aws_security_group.http_in_out.id}"
} #makes security groups build before webservers
output "sg-https_id" {
  value = "${aws_security_group.https_in_out.id}"
} #makes security groups build before webservers
output "sg-BH_Cluster_Open" {
  value = "${aws_security_group.BH_Cluster_Open.id}"
}
output "sg-node_out" {
  value = "${aws_security_group.node_out.id}"
}
