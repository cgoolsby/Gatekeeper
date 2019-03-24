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
#module "bastion" {
#  source = "./modules/bastion/"
#  public_subnet_id = "${module.subnets.public_subnet_ids[0]}"
#  sg-ssh_id = "${module.security_groups.sg-ssh_id}" 
#  key_name = "${var.key_name}"
#  vpc_id = "${module.vpc_network.vpc_id}"
#  sg-bastion_id = "${module.security_groups.sg-BH_Cluster_Open}"
#}
module "route_tables" {
  source = "./modules/network/route_tables/"
  vpc_id = "${module.vpc_network.vpc_id}"
  igw_id = "${module.internet_gateway.igw_id}"
  Public_Subnet_id_list = "${module.subnets.public_subnet_ids}"
  Private_Subnet_id_list = "${module.subnets.private_subnet_ids}"
}
#module "webservers" { #Note, this is not 'dead' code.  A user can enable this if they want a flask front-end.  It is here if they want it.
#  source = "./modules/webservers/"
#  vpc_id = "${module.vpc_network.vpc_id}"
#  public_subnet_id = "${module.subnets.public_subnet_ids[0]}"
#  private_subnet_id = "${module.subnets.private_subnet_ids[0]}"
#  sg-ssh_id = "${module.security_groups.sg-ssh_id}" 
#  sg-http_id = "${module.security_groups.sg-http_id}" 
#  sg-https_id = "${module.security_groups.sg-https_id}" 
#  github_link = "${var.github_link}"
#  aws_key_name = "${var.key_name}"
#  aws_key_path = "${var.key_path}"
#}
#module "s3" { #Ditto, this is for making an s3 bucket if desired.
#  source = "./modules/s3/"
#}
module "k8s" {
  source = "./modules/k8s/"
  vpc_id = "${module.vpc_network.vpc_id}"
  EKS_Subnet_list = "${module.subnets.public_subnet_ids}"
  sg-BH_Cluster_Open_id = "${module.security_groups.sg-BH_Cluster_Open}"
  sg-node_out_id = "${module.security_groups.sg-node_out}"
  sg-ssh_id = "${module.security_groups.sg-ssh_id}" 
  num_EKS_nodes_desired = "${var.KubeNodes}"
  num_EKS_nodes_max = "${var.KubeNodes}"
  num_EKS_nodes_min = 1
  EKS_name = "Terraform-EKS"
  EKS_instance_type = "${var.KubeNodeType}"
  EBSsize = "${var.EBSsize}"
}
module "k8s_setup" {
  source = "./modules/k8s_setup/"
  k8s_trigger = "${module.k8s.k8s_finished}"
  KubeNodeType = "${var.KubeNodeType}"
  KubeNodes = "${var.KubeNodes}"
  Ingestion = "${var.Ingestion}"
  IngestionPorts = "${var.IngestionPorts}"
  IngestionMaster = "${var.IngestionMaster}"
  IngestionWorker = "${var.IngestionWorker}"
  IngestionMasterCPUMax = "${var.IngestionMasterCPUMax}"
  IngestionMasterCPUMin = "${var.IngestionMasterCPUMin}"
  IngestionMasterMemMax = "${var.IngestionMasterMemMax}"
  IngestionMasterMemMin = "${var.IngestionMasterMemMin}"
  IngestionWorkerCPUMax = "${var.IngestionWorkerCPUMax}"
  IngestionWorkerCPUMin = "${var.IngestionWorkerCPUMin}"
  IngestionWorkerMemMax = "${var.IngestionWorkerMemMax}"
  IngestionWorkerMemMin = "${var.IngestionWorkerMemMin}"
  Compute = "${var.Compute}"
  ComputePorts = "${var.ComputePorts}"
  ComputeMaster = "${var.ComputeMaster}"
  ComputeWorker = "${var.ComputeWorker}"
  ComputeMasterCPUMax = "${var.ComputeMasterCPUMax}"
  ComputeMasterCPUMin = "${var.ComputeMasterCPUMin}"
  ComputeMasterMemMax = "${var.ComputeMasterMemMax}"
  ComputeMasterMemMin = "${var.ComputeMasterMemMin}"
  ComputeWorkerCPUMax = "${var.ComputeWorkerCPUMax}"
  ComputeWorkerCPUMin = "${var.ComputeWorkerCPUMin}"
  ComputeWorkerMemMax = "${var.ComputeWorkerMemMax}"
  ComputeWorkerMemMin = "${var.ComputeWorkerMemMin}"
  Database = "${var.Database}"
  DatabasePorts = "${var.DatabasePorts}"
  DatabaseCopies = "${var.DatabaseCopies}"
  DatabaseSize = "${var.DatabaseSize}"
  database_exists = "${var.database_exists}"
  compute_exists = "${var.compute_exists}"
  ingestion_exists = "${var.ingestion_exists}"
}
module "extraEC2" {
  source = "./modules/extraEC2/"
  extraEC2count = "${var.EC2num}"
  aws_instance_type = "${var.EC2type}"
  public_subnet_id = "${module.subnets.public_subnet_ids[0]}"
  sg-ssh_id = "${module.security_groups.sg-ssh_id}" 
  aws_key_name = "${var.key_name}"
  sg-BH_Cluster_id = "${module.security_groups.sg-BH_Cluster_Open}"
}
