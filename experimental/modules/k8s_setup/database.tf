resource "null_resource" "createDatabase" {
  count = "${var.database_exists}"
  provisioner "local-exec" {
    command = "bash runDatabase.sh ${var.Database}   ${var.DatabasePorts} PortEnd  ${var.DatabaseCopies}   ${var.DatabaseSize}"
}
}
