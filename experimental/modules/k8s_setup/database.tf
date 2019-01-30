resource "null_resource" "createDatabase" {
  count = "${var.database_exists}"
  triggers = {
    discard = "${uuid()}"
  }
  provisioner "local-exec" {
    working_dir = "${path.module}"
    command = "bash ${path.module}/runDatabase.sh ${var.Database}   ${var.DatabasePorts} PortEnd  ${var.DatabaseCopies}   ${var.DatabaseSize}"
}
}
