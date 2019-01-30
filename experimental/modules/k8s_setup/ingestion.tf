resource "null_resource" "createIngestion" {
  count = "${var.ingestion_exists}"
  triggers = {
    discard = "${uuid()}"
  }
  provisioner "local-exec" {
    working_dir = "${path.module}"
    command = "bash ${path.module}/runIngestion.sh ${var.Ingestion}   ${var.IngestionPorts} PortEnd  ${var.IngestionMaster}   ${var.IngestionWorker}   ${var.IngestionMasterCPUMax}   ${var.IngestionMasterCPUMin}   ${var.IngestionMasterMemMax}   ${var.IngestionMasterMemMin}   ${var.IngestionWorkerCPUMax}   ${var.IngestionWorkerCPUMin}   ${var.IngestionWorkerMemMax}   ${var.IngestionWorkerMemMin}"
}
}
