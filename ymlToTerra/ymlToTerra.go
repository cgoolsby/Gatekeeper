package main

import (
  "fmt"
  "bufio"
  "os"
  "strings"
  "strconv"
  "reflect"
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

  EC2num int
  EC2type string
  EC2Ports []int
}




func main() {
  fmt.Println("Placeholder")
  file, err := os.Open(fileName)
  if err != nil {
    panic(err)
  }
  defer file.Close()

  scanner := bufio.NewScanner(file)
  var i = 0
  var a = 0
  var custom setup
  for scanner.Scan() {
    var line []string
    line = strings.Split(scanner.Text(), ": ")
    i = i + 1
//    fmt.Println(i, line)
    switch i {
      case 1:
        custom.kubeNodeType = line[1]
      case 2:
        custom.kubeNodes, err = strconv.Atoi(line[1])
        check(err)
      case 3:
        custom.ingestion = line[1]
      case 4:
        i = i - 1
        if(line[1] != "None" && line[0] == "OpenPort"){
          a, err = strconv.Atoi(line[1])
          check(err)
          custom.ingestionPorts = append(custom.ingestionPorts, a)
        }
        if(line[0] != "OpenPort") {
          custom.ingestionMaster, err = strconv.Atoi(line[1])
          check(err)
          i = i + 1
        }
      case 5:
        custom.ingestionWorker, err = strconv.Atoi(line[1])
        check(err)
      case 6:
        custom.ingestionMasterCPUMax, err = strconv.Atoi(line[1])
        check(err)
      case 7:
        custom.ingestionMasterCPUMin, err = strconv.Atoi(line[1])
        check(err)
      case 8:
        custom.ingestionMasterMemMax, err = strconv.Atoi(line[1])
        check(err)
      case 9:
        custom.ingestionMasterMemMin, err = strconv.Atoi(line[1])
        check(err)
      case 10:
        custom.ingestionWorkerCPUMax, err = strconv.Atoi(line[1])
        check(err)
      case 11:
        custom.ingestionWorkerCPUMin, err = strconv.Atoi(line[1])
        check(err)
      case 12:
        custom.ingestionWorkerMemMax, err = strconv.Atoi(line[1])
        check(err)
      case 13:
        custom.ingestionWorkerMemMin, err = strconv.Atoi(line[1])
        check(err)
      case 14:
        custom.compute = line[1]
      case 15:
        i = i - 1
        if(line[1] != "None" && line[0] == "OpenPort"){
          a, err = strconv.Atoi(line[1])
          check(err)
          custom.computePorts = append(custom.computePorts, a)
        }
        if(line[0] != "OpenPort") {
          custom.computeMaster, err = strconv.Atoi(line[1])
          check(err)
          i = i + 1
        }
      case 16:
        custom.computeWorker, err = strconv.Atoi(line[1])
        check(err)
      case 17:
        custom.computeMasterCPUMax, err = strconv.Atoi(line[1])
        check(err)
      case 18:
        custom.computeMasterCPUMin, err = strconv.Atoi(line[1])
        check(err)
      case 19:
        custom.computeMasterMemMax, err = strconv.Atoi(line[1])
        check(err)
      case 20:
        custom.computeMasterMemMin, err = strconv.Atoi(line[1])
        check(err)
      case 21:
        custom.computeWorkerCPUMax, err = strconv.Atoi(line[1])
        check(err)
      case 22:
        custom.computeWorkerCPUMin, err = strconv.Atoi(line[1])
        check(err)
      case 23:
        custom.computeWorkerMemMax, err = strconv.Atoi(line[1])
        check(err)
      case 24:
        custom.computeWorkerMemMin, err = strconv.Atoi(line[1])
        check(err)
      case 25:
        custom.database = line[1]
      case 26:
        i = i - 1
        if(line[1] != "None" && line[0] == "OpenPort"){
          a, err = strconv.Atoi(line[1])
          check(err)
          custom.databasePorts = append(custom.databasePorts, a)
        }
        if(line[0] != "OpenPort") {
          custom.databaseCopies, err = strconv.Atoi(line[1])
          check(err)
          i = i + 1
        }
      case 27:
        custom.databaseSize, err = strconv.Atoi(line[1])
        check(err)
      case 28:
        custom.EC2num, err = strconv.Atoi(line[1])
        check(err)
      case 29:
        custom.EC2type = line[1]
      case 30:
        if(line[1] != "None" && line[0] == "OpenPort"){
          a, err = strconv.Atoi(line[1])
          check(err)
          custom.EC2Ports = append(custom.EC2Ports, a)
          i = i - 1
        }
    }
  }
 //begin taking struct values and making terraform.tfvars file
    v := reflect.ValueOf(&custom).Elem()
    typeOfV := v.Type()
    for i := 0; i < v.NumField(); i++ {
      f := v.Field(i)
      fmt.Printf("%d: %s %s = %v\n", i,
typeOfV.Field(i).Name, f.Type(), f.CanInterface())
    }
}


