output "config_map_aws_auth" {
  value = "${module.k8s.config_map_aws_auth}"
}
output "kubeconfig" {
    value = "${module.k8s.kubeconfig}"
}
output "Monitoring" {
  value = "To enable Monitoring, run the bash scripts Prometheus.sh and Dashboard.sh."
}
