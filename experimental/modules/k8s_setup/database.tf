resource "null_resource" "createDatabase" {
  count = "${var.database_exists}"
  working_dir = "${path.module}"
  triggers = {
    discard = "${uuid()}"
  }
  provisioner "local-exec" {
    command = "bash ${path.module}/runDatabase.sh ${var.Database}   ${var.DatabasePorts} PortEnd  ${var.DatabaseCopies}   ${var.DatabaseSize}"
}
}
