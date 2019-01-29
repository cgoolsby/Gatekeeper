variable "KubeNodeType" {default = "m4.large"}
variable "KubeNodes" {default = "5"}
variable "Ingestion" {default = "None"}
variable "IngestionPorts" {default = [""]
  type = "list"
}
variable "IngestionMaster" {default = "1"}
variable "IngestionWorker" {default = "3"}
variable "IngestionMasterCPUMax" {default = "1000"}
variable "IngestionMasterCPUMin" {default = "500"}
variable "IngestionMasterMemMax" {default = "1000"}
variable "IngestionMasterMemMin" {default = "500"}
variable "IngestionWorkerCPUMax" {default = "1"}
variable "IngestionWorkerCPUMin" {default = "1"}
variable "IngestionWorkerMemMax" {default = "1"}
variable "IngestionWorkerMemMin" {default = "1"}
variable "Compute" {default = "Hadoop.Spark"}
variable "ComputePorts" {default = [""]
  type = "list"
}
variable "ComputeMaster" {default = "1"}
variable "ComputeWorker" {default = "3"}
variable "ComputeMasterCPUMax" {default = "1"}
variable "ComputeMasterCPUMin" {default = "1"}
variable "ComputeMasterMemMax" {default = "1"}
variable "ComputeMasterMemMin" {default = "1"}
variable "ComputeWorkerCPUMax" {default = "1"}
variable "ComputeWorkerCPUMin" {default = "1"}
variable "ComputeWorkerMemMax" {default = "1"}
variable "ComputeWorkerMemMin" {default = "1"}
variable "Database" {default = "None"}
variable "DatabasePorts" {default = [""]
  type = "list"
}
variable "DatabaseCopies" {default = "1"}
variable "DatabaseSize" {default = "40"}
variable "EC2num" {default = "0"}
variable "EC2type" {default = "t2.micro"}
variable "EC2Ports" {default = [""]
  type = "list"
}
variable "database_exists" {default = 0}
variable "compute_exists" {default = 0}
variable "ingestion_exists" {default = 0}
