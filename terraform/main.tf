provider "http" {}
provider "aws" {
  region = "us-west-2"#TD
}

module "vpc_network" {
  source = "./modules/network/vpc/"
 }
module "internet_gateway" {
  source = "./modules/network/igw/"
  vpc_id = "${module.vpc_network.vpc_id}"
}
module "security_groups" {
  source = "./modules/network/security_groups/"
  vpc_id = "${module.vpc_network.vpc_id}"
}
module "subnets" {
  source = "./modules/network/subnets/"
  vpc_id = "${module.vpc_network.vpc_id}"
}
module "bastion" {
  source = "./modules/bastion/"
  public_subnet_id = "${module.subnets.public_subnet_ids[0]}"
  sg-ssh_id = "${module.security_groups.sg-ssh_id}" 
  key_name = "${var.key_name}"
  vpc_id = "${module.vpc_network.vpc_id}"
  sg-bastion_id = "${module.security_groups.sg-BH_Cluster_Open}"
}
  
module "route_tables" {
  source = "./modules/network/route_tables/"
  vpc_id = "${module.vpc_network.vpc_id}"
  igw_id = "${module.internet_gateway.igw_id}"
  Public_Subnet_id_list = "${module.subnets.public_subnet_ids}"
  Private_Subnet_id_list = "${module.subnets.private_subnet_ids}"
}
module "webservers" {
  source = "./modules/webservers/"
  vpc_id = "${module.vpc_network.vpc_id}"
  public_subnet_id = "${module.subnets.public_subnet_ids[0]}"
  private_subnet_id = "${module.subnets.private_subnet_ids[0]}"
  sg-ssh_id = "${module.security_groups.sg-ssh_id}" 
  sg-http_id = "${module.security_groups.sg-http_id}" 
  sg-https_id = "${module.security_groups.sg-https_id}" 
  github_link = "${var.github_link}"
  aws_key_name = "${var.key_name}"
  aws_key_path = "${var.key_path}"
}
#module "s3" {
#  source = "./modules/s3/"
#}
module "k8s" {
  source = "./modules/k8s/"
  vpc_id = "${module.vpc_network.vpc_id}"
  EKS_Subnet_list = "${module.subnets.public_subnet_ids}"
#  private_subnet_id = "${module.subnets.private_subnet_ids}"
  sg-BH_Cluster_Open_id = "${module.security_groups.sg-BH_Cluster_Open}"
  sg-node_out_id = "${module.security_groups.sg-node_out}"
  ### Where the tech params will be passed in
  num_EKS_nodes_desired = "${var.EKS_nodes}"
  num_EKS_nodes_max = "${var.EKS_nodes}"
  num_EKS_nodes_min = 1
  EKS_name = "Terraform-EKS"
  EKS_instance_type = "${var.Node_type}"
}
