resource "null_resource" "createIngestion" {
  count = "${var.db_exists}"
  provisioner "local-exec" {
    command = "bash runDatabase.sh ${var.Database}   ${var.DatabasePorts} PortEnd  ${var.DatabaseCopies}   ${var.DatabaseSize}"
}
