resource "null_resource" "createCompute" {
  count = "${var.compute_exists}"
  triggers = {
    discard = "${uuid()}"
  }
  provisioner "local-exec" {
    working_dir = "${path.module}"
    command = "bash ${path.module}/runCompute.sh ${var.Compute}   ${var.ComputePorts} PortEnd  ${var.ComputeMaster}   ${var.ComputeWorker}   ${var.ComputeMasterCPUMax}   ${var.ComputeMasterCPUMin}   ${var.ComputeMasterMemMax}   ${var.ComputeMasterMemMin}   ${var.ComputeWorkerCPUMax}   ${var.ComputeWorkerCPUMin}   ${var.ComputeWorkerMemMax}   ${var.ComputeWorkerMemMin}"
}
}
