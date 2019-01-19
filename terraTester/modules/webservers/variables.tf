variable "aws_region" {
  default = "us-west-2"
}
variable "vpc_id"{
  description = "the vpc id"
}
variable "public_subnet_id" {}
variable "private_subnet_id" {}
variable "aws_key_name" {
  default = "keyDesktop"
}
variable "aws_key_path" {
   default = "~/.ssh/keyDesktop.pem"
}
variable "sg-ssh_id" {}
variable "sg-http_id" {}
variable "sg-https_id" {}
variable "aws_instance_type" {
  default = "t2.micro"
}
variable "aws_instance_user" {
  default = "ubuntu"
}

#variable "web_instance_count" {}

variable "aws_security_group_count" {
  default = "3"
}
variable "aws_security_group_name" {
  type = "list"
  default = ["ssh_22", "http_in", "https_in"]
}
variable "aws_security_group_ingress_from_port" {
  type = "list"
  default = [22, 80, 443]
}
variable "aws_security_group_ingress_to_port" {
  type = "list"
  default = [22,80, 443]
}
variable "aws_security_group_ingress_protocol" {
  type = "list"
  default = ["tcp", "tcp", "tcp"]
}
