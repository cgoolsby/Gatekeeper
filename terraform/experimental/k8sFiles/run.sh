terraform output kubeconfig > ~/.kube/config
terraform output config_map_aws_auth > config_map_aws_auth.yml
kubectl create -f config_map_aws_auth.yml
