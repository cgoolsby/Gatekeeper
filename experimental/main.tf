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
module "route_tables" {
  source = "./modules/network/route_tables/"
  vpc_id = "${module.vpc_network.vpc_id}"
  igw_id = "${module.internet_gateway.igw_id}"
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
  public_subnet_id = "${module.subnets.public_subnet_id}"
  sg-ssh_id = "${module.security_groups.sg-ssh_id}" 
  key_name = "${var.key_name}"
  vpc_id = "${module.vpc_network.vpc_id}"
}
  
resource "aws_main_route_table_association" "a" {
  vpc_id = "${module.vpc_network.vpc_id}"
  route_table_id = "${module.route_tables.public_id}"
}
module "webservers" {
  source = "./modules/webservers/"
  vpc_id = "${module.vpc_network.vpc_id}"
  public_subnet_id = "${module.subnets.public_subnet_id}"
  private_subnet_id = "${module.subnets.private_subnet_id}"
  sg-ssh_id = "${module.security_groups.sg-ssh_id}" 
  sg-http_id = "${module.security_groups.sg-http_id}" 
  sg-https_id = "${module.security_groups.sg-https_id}" 
  github_link = "${var.github_link}"
  aws_key_name = "${var.key_name}"
}
