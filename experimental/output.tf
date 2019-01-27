output "config_map_aws_auth" {
  value = "${module.k8s.config_map_aws_auth}"
}
output "kubeconfig" {
    value = "${module.k8s.kubeconfig}"
}
