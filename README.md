# Gatekeeper

Gatekeeper is an Open Source platform for deploying various Data Engineering tools on AWS.
It supports ease of use by giving the user a CLI which guides them through enabling kubernetes pods of their chosen technologies


Requirements
Terraform : https://learn.hashicorp.com/terraform/getting-started/install.html
AWS-CLI   : https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
AWS-IAM   : https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
AWS Account with EKS permissions.
Go        : https://golang.org/doc/install/source
Everything should be run from a bash shell.

Usage:
git clone https://github.com/cgoolsby/gateKeeper
cd gateKeeper
go run ./main2.go
This produces a variables_override.tf in your main directory.  In case you want to skip to this step in the future.
cp variables_override.tf terraForm/
cd terraForm
terraform init
terraform apply
type yes and go get a coffee.
Voila, you have the infrastructure of your pipeline.



In general, editing the yml files of your respective technologies should be straightforward.  I HIGHLY recommend making a backup of each file before you begin.

TODOs:
Implement sed feature to control # of master/worker nodes, and cpumin/maxing
Implement opening additional ports
