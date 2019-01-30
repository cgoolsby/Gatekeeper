variable "cluster-name" {
  default = "cluster-name"
}
variable "availability_zone_ebs" {
  default = "us-west-2a"
}
variable "vpc_id" {}
variable "sg-node_out_id" {}
variable "sg-ssh_id" {}
variable "num_EKS_nodes_desired" {}
variable "num_EKS_nodes_max" {}
variable "num_EKS_nodes_min" {}
variable "EKS_name" {}
variable "EKS_Subnet_list" {
  type = "list"
}
variable "sg-BH_Cluster_Open_id" {}
variable "EKS_instance_type" {}
