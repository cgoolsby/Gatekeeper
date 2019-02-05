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
git clone https://github.com/cgoolsby/gateKeeper\n
cd gateKeeper\n
go run ./main2.go\n
This produces a variables_override.tf in your main directory.  In case you want to skip to this step in the future.\n
cp variables_override.tf terraForm/\n
cd terraForm\n
terraform init\n
terraform apply\n
type yes and go get a coffee.\n
Voila, you have the infrastructure of your pipeline.\n\n\n
Some Basic Commands to help you get started\n\n
kubectl get pods -o wide          -- a display of your currently running pods\n
kubectl get services -o wide      -- a display of your currently running services\n
kubectl exec -it PODNAME -- bash  -- open a bash shell in a specific pod\n
------Be Aware that if you need more dependencies, you may need to edit kubernetes files.  The easiest way to do this is to find a docker image which has the tech stack you need ---- \n

In general, editing the yml files of your respective technologies should be straightforward.  I HIGHLY recommend making a backup of each file before you begin.


MONITORING:
Currently only native Kubernetes Monitoring is supported with plans to support Prometheus/Grafana in the Future.  In order to do this, Run 'bash terraForm/Dashboard.sh' and follow the onscreen instructions.

TODOs:
Implement sed feature to control # of master/worker nodes, and cpumin/maxing
Implement opening additional ports
