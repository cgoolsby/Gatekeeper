variable "key_name" {
  description = ".pem prefix"
  default = "jello"
}
variable "key_path" {
  description = ".pem suffix included"
  default = "~/.ssh/jello.pem"
}
variable "github_link" {
  description = "link to github w/ your flask app"
#  default = "https://github.com/cgoolsby/simpleFlaskTester"
  default = "cgoolsby/simpleFlaskTester"
}
variable "KubeNodes" {
  default = 2
}
variable "KubeNodeType" {
  default = "t2.micro"
}
variable "Ingestion" {
  default = "None"
}
variable "IngestionPorts" {
  default = ""
}
variable "IngestionMaster" {
  default = 0
}
variable "IngestionWorker" {
  default = 0
}
variable "IngestionMasterCPUMax" {
  default = 0
}
variable "IngestionMasterCPUMin" {
  default = 0
}
variable "IngestionMasterMemMax" {
  default = 0
}
variable "IngestionMasterMemMin" {
  default = 0
}
variable "IngestionWorkerCPUMax" {
  default = 0
}
variable "IngestionWorkerCPUMin" {
  default = 0
}
variable "IngestionWorkerMemMax" {
  default = 0
}
variable "IngestionWorkerMemMin" {
  default = 0
}
variable "Compute" {
  default = "None"
}
variable "ComputePorts" {
  default = ""
}
variable "ComputeMaster" {
  default = 0
}
variable "ComputeWorker" {
  default = 0
}
variable "ComputeMasterCPUMax" {
  default = 0
}
variable "ComputeMasterCPUMin" {
  default = 0
}
variable "ComputeMasterMemMax" {
  default = 0
}
variable "ComputeMasterMemMin" {
  default = 0
}
variable "ComputeWorkerCPUMax" {
  default = 0
}
variable "ComputeWorkerCPUMin" {
  default = 0
}
variable "ComputeWorkerMemMax" {
  default = 0
}
variable "ComputeWorkerMemMin" {
  default = 0
}
variable "Database" {
  default = "None"
}
variable "DatabasePorts" {
  default = ""
}
variable "DatabaseCopies" {
  default = 0
}
variable "DatabaseSize" {
  default = 0
}
variable "EBSsize" {
  default = 40
}
variable "EC2num" {
  default = 0
}
variable "EC2type" {
  default = "t2.micro"
}
variable "EC2Ports" {
  default = ""
}
