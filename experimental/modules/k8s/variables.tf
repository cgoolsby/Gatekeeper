variable "cluster-name" {
  default = "cluster-name"
}
variable "availability_zone_ebs" {
  default = "us-west-2a"
}
variable "num_EKS_nodes_desired" {}
variable "num_EKS_nodes_max" {}
variable "num_EKS_nodes_min" {}
variable "EKS_name" {}
variable "EKS_Subnet_list" {}
