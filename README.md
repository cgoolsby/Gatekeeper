# Gatekeeper

Gatekeeper is an Open Source platform for deploying various Data Engineering tools on AWS.
It supports ease of use by giving the user a CLI which guides them through enabling kubernetes pods of their chosen technologies


Requirements<br/>
Terraform : https://learn.hashicorp.com/terraform/getting-started/install.html<br/>
AWS-CLI   : https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html<br/>
AWS-IAM   : https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html<br/>
Go        : https://golang.org/doc/install/source<br/>
AWS Account with EKS permissions.<br/>
Everything should be run from a bash shell.<br/>

Usage:
```
git clone https://github.com/cgoolsby/gateKeeper
```
```
cd gateKeeper
```
```
go run ./main.go
```

This produces a variables_override.tf in your main directory.  In case you want to skip to this step in the future.<br/>
```
cp variables_override.tf terraForm/
```
```
cd terraForm
```
```
terraform init
```
```
terraform apply
```
type yes and go get a coffee.<br/>
Voila, you have the infrastructure of your pipeline.<br/><br/><br/>
Some Basic Commands to help you get started<br/><br/>
```
kubectl get pods -o wide          ## a display of your currently running pods
```
```
kubectl get services -o wide      ## a display of your currently running services
```
```
kubectl exec -it $PODNAME -- bash  ## open a bash shell in a specific pod
```
------Be Aware that if you need more dependencies, you may need to edit kubernetes files.  The easiest way to do this is to find a docker image which has the tech stack you need ---- <br/>

In general, editing the yml files of your respective technologies should be straightforward.  I HIGHLY recommend making a backup of each file before you begin.


MONITORING:
Kubernetes Native Monitoring as well as Prometheus/Grafana are supported.  Run Dashboard.sh for Kubernetes and/or Prometheus.sh for Prometheus/Grafana.

```
bash terraForm/Dashboard.sh #Kubernetes Dashboard
```
```
cd ~/Desktop/
https://github.com/coreos/prometheus-operator.git
cd -
bash terraform/Promethus.sh
```
TODOs:
Implement sed feature to control # of master/worker nodes, and cpumin/maxing<br/>
Implement opening additional ports as per user specifications<br/>
Implement Web Server Toggle <br/>
Implement Prometheus Monitoring Toggle (Per Tech? or Just Overall?)<br/>
