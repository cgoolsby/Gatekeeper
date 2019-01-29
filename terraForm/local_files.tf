resource "local_file" "webserver_ip" {
    content     = "${module.webservers.elb_address}"
    filename = "webserver_ip.txt"
}
resource "local_file" "eks_config" {
    content     = "${module.k8s.kubeconfig}"
    filename = "kubeconfig"
}
resource "null_resource" "makeKubeConfig" {
  triggers { 
    template = "${local_file.eks_config.content}"
  }
  provisioner "local-exec" {
    command = "cp kubeconfig ~/.kube/config"
  }
}
resource "local_file" "config_map_aws_auth" {
    content     = "${module.k8s.config_map_aws_auth}"
    filename = "config_map_aws_auth.yml"
}
resource "null_resource" "ApplyAWSCredentials" {
  triggers { 
    template = "${local_file.config_map_aws_auth.content}"
  }
  provisioner "local-exec" {
    command = "kubectl apply -f config_map_aws_auth.yml"
  }
}
