#locals {
#  portsList = "${join(" ", var.vari)}"
#}
resource "null_resource" "ApplyAWSCredentials" {
  provisioner "local-exec" {
#    command = "echo ${local.portsList}"
    command = "echo ${var.vari}"
  }
}
