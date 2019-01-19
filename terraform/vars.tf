###General Setup
variable "environment" {
  description = "the environment"
  default = "${terraform.workspace}"
}
variable "vpc_id" {
  description = "The VPC id"
}
variable "region" {
  description = "AWS region"
  default = "us-west-2"
}#TODO: replace w/ ping lookup
variable "availability_zones" {
  type        = "list"
  description = "The az that the resources will be launched"
}#TODO: replace w/ data lookup
variable "k8s_cluster" {
  description = "name of EKS"
  default = "cubeKluster"
}
variable "s3_url" {
  description = "where initial dataset is stored"
  default = ""
}
###Account Logic
variable "access_key" {
  description = "REMEMBER TO .GITIGNORE"
  default = "SET YOUR GITIGNORE FILE!!!"
}
variable "aws_account" {
  description = "MAKE CERTAIN TO SET YOUR .GITIGNORE FILE!!"
  default = "Double Check It!"
}
###Cluster Logic
variable "cluster_tech" {
  description = "what technology cluster is doing the processing"
  default = "spark"
}
variable "master_nodes" {
  description = "number of master nodes"
  default = "1"
}
variable "worker_nodes" {
  description = "number of worker nodes"
  default = "2"
}
variable "path_to_web_server" {
  description = "path to a flask app"
  default = "web_server"
}
variable "node_size" {
  description = "which ec2 instance will host nodes"
  default = "t2.micro"
}
###Network Logic
variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}
variable "public_subnets_cidr" {
  type        = "list"
  description = "The CIDR block for the public subnet"
}
variable "private_subnets_cidr" {
  type        = "list"
  description = "The CIDR block for the private subnet"
}
###Database Logic
variable "database_name" {
  type = "list"
  description = "The database name"
  default = [""]
}
variable "database_username" {
  description = "The username of the databases"
  default = "USERNAME"
}
variable "database_password" {
  description = "The password of the databases"
  default = "Passw0rd"
}
variable "allocated_storage" {
  default     = "20"
  description = "The storage size in GB for a database"
}
###Network Logic
variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
  default = "10.0.0.0/16"
}
variable "public_subnets_cidr" {
  type        = "list"
  description = "The CIDR block for the public subnet"
  default = ["10.0.0.0/24"]
}
variable "private_subnets_cidr" {
  type        = "list"
  description = "The CIDR block for the private subnet"
  default = ["10.0.1.0/24"]
}
variable "subnet_ids" {
  type        = "list"
  description = "Subnet ids"
  default = ["default-name"]
}
