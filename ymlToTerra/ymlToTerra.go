package main

import (
  "fmt"
  "bufio"
  "os"
  "strings"
)

var fileName = "test.yml"


func check(e error) {
    if e != nil {
        panic(e)
    }
}

type setup struct {

  kubeNodeType string
  kubeNodes int

  ingestion string
  ingestionPorts []int
  ingestionMaster int
  ingestionWorker int
  ingestionMasterCPUMax int
  ingestionMasterCPUMin int
  ingestionMasterMemMax int
  ingestionMasterMemMin int
  ingestionWorkerCPUMax int
  ingestionWorkerCPUMin int
  ingestionWorkerMemMax int
  ingestionWorkerMemMin int

  compute string
  computePorts []int
  computeMaster int
  computeWorker int
  computeMasterCPUMax int
  computeMasterCPUMin int
  computeMasterMemMax int
  computeMasterMemMin int
  computeWorkerCPUMax int
  computeWorkerCPUMin int
  computeWorkerMemMax int
  computeWorkerMemMin int

  database string
  databasePorts []int
  databaseCopies int
  databaseSize int

  EC2 int
  EC2Type string
  EC2Ports []int
}




func main() {
  file, err := os.Open(fileName)
  if err != nil {
    panic(err)
  }
  defer file.Close()

  scanner := bufio.NewScanner(file)
  var i := 0
  var custom setup
  for scanner.Scan() {
    var line []string
    line = strings.Split(scanner.Text(), ":")
    i = i + 1
    switch i:
      case 1:
        custom.kubeNodeType = line[1]
      case 2:
        custom.kubeNodes = line[1]
      case 3:
        custom.ingestion = line[1]
      case 4:
        if(line[1] != "None" && line[0] == "OpenPort"){
          custom.ingestionPorts = append(custom.ingestionPorts, line[1])
          i = i - 1
        }
      case 5:
        custom.ingestionMaster = line[1]
      case 6:
        custom.ingestionWorker = line[1]
      case 7:
        custom.ingestionMasterCPUMax = line[1]
      case 8:
        custom.ingestionMasterCPUMin = line[1]
      case 9:
        custom.ingestionMasterMemMax = line[1]
      case 10:
        custom.ingestionMasterMemMin = line[1]
      case 11:
        custom.ingestionWorkerCPUMax = line[1]
      case 12:
        custom.ingestionWorkerCPUMin = line[1]
      case 13:
        custom.ingestionWorkerMemMax = line[1]
      case 14:
        custom.ingestionWorkerMemMin = line[1]
      case 15:
        custom.compute = line[1]
      case 16:
        if(line[1] != "None" && line[0] == "OpenPort"){
          custom.computePorts = append(custom.computePorts, line[1])
          i = i - 1
        }
      case 17:
        custom.computeMaster = line[1]
      case 18:
        custom.computeWorker = line[1]
      case 19:
        custom.computeMasterCPUMax = line[1]
      case 20:
        custom.computeMasterCPUMin = line[1]
      case 21:
        custom.computeMasterMemMax = line[1]
      case 22:
        custom.computeMasterMemMin = line[1]
      case 23:
        custom.computeWorkerCPUMax = line[1]
      case 24:
        custom.computeWorkerCPUMin = line[1]
      case 25:
        custom.computeWorkerMemMax = line[1]
      case 26:
        custom.computeWorkerMemMin = line[1]
      case 27:
        custom.database = line[1]
      case 28:
        if(line[1] != "None" && line[0] == "OpenPort"){
          custom.databasePorts = append(custom.databasePorts, line[1])
          i = i - 1
        }
      case 29:
        custom.databaseCopies = line[1]
      case 30:
        custom.databaseSize = line[1]
  }
}
