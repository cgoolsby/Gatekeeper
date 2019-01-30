package main

import (
  "fmt"
  "bufio"
  "os"
  "strings"
  "strconv"
  "reflect"
  "os/exec"
)

var fileName = "test.yml"


func check(e error) {
    if e != nil {
        panic(e)
    }
}

type setup struct {

  KubeNodeType string
  KubeNodes int

  Ingestion string
  IngestionPorts []int
  IngestionMaster int
  IngestionWorker int
  IngestionMasterCPUMax int
  IngestionMasterCPUMin int
  IngestionMasterMemMax int
  IngestionMasterMemMin int
  IngestionWorkerCPUMax int
  IngestionWorkerCPUMin int
  IngestionWorkerMemMax int
  IngestionWorkerMemMin int

  Compute string
  ComputePorts []int
  ComputeMaster int
  ComputeWorker int
  ComputeMasterCPUMax int
  ComputeMasterCPUMin int
  ComputeMasterMemMax int
  ComputeMasterMemMin int
  ComputeWorkerCPUMax int
  ComputeWorkerCPUMin int
  ComputeWorkerMemMax int
  ComputeWorkerMemMin int

  Database string
  DatabasePorts []int
  DatabaseCopies int
  DatabaseSize int

  EC2num int
  EC2type string
  EC2Ports []int
}



func writeVariable(fileNameOut, varName string, defaultVal interface {}) {
  //write := ("variable \""+ varName + "\" {default = \"" + defaultVal + "\"}")
  write := fmt.Sprintf("variable \"%v\" {default = \"%v\"}\n", varName, defaultVal)
  f, err := os.OpenFile(fileNameOut, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
  if err != nil {
    check(err)
  }
  if _, err := f.Write([]byte(write)); err != nil {
    check(err)
  }
 if err := f.Close(); err != nil {
   check(err)
 }
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
        custom.KubeNodeType = line[1]
      case 2:
        custom.KubeNodes, err = strconv.Atoi(line[1])
        check(err)
      case 3:
        custom.Ingestion = line[1]
      case 4:
        i = i - 1
        if(line[1] != "None" && line[0] == "OpenPort"){
          a, err = strconv.Atoi(line[1])
          check(err)
          custom.IngestionPorts = append(custom.IngestionPorts, a)
        }
        if(line[0] != "OpenPort") {
          custom.IngestionMaster, err = strconv.Atoi(line[1])
          check(err)
          i = i + 1
        }
      case 5:
        custom.IngestionWorker, err = strconv.Atoi(line[1])
        check(err)
      case 6:
        custom.IngestionMasterCPUMax, err = strconv.Atoi(line[1])
        check(err)
      case 7:
        custom.IngestionMasterCPUMin, err = strconv.Atoi(line[1])
        check(err)
      case 8:
        custom.IngestionMasterMemMax, err = strconv.Atoi(line[1])
        check(err)
      case 9:
        custom.IngestionMasterMemMin, err = strconv.Atoi(line[1])
        check(err)
      case 10:
        custom.IngestionWorkerCPUMax, err = strconv.Atoi(line[1])
        check(err)
      case 11:
        custom.IngestionWorkerCPUMin, err = strconv.Atoi(line[1])
        check(err)
      case 12:
        custom.IngestionWorkerMemMax, err = strconv.Atoi(line[1])
        check(err)
      case 13:
        custom.IngestionWorkerMemMin, err = strconv.Atoi(line[1])
        check(err)
      case 14:
        custom.Compute = line[1]
      case 15:
        i = i - 1
        if(line[1] != "None" && line[0] == "OpenPort"){
          a, err = strconv.Atoi(line[1])
          check(err)
          custom.ComputePorts = append(custom.ComputePorts, a)
        }
        if(line[0] != "OpenPort") {
          custom.ComputeMaster, err = strconv.Atoi(line[1])
          check(err)
          i = i + 1
        }
      case 16:
        custom.ComputeWorker, err = strconv.Atoi(line[1])
        check(err)
      case 17:
        custom.ComputeMasterCPUMax, err = strconv.Atoi(line[1])
        check(err)
      case 18:
        custom.ComputeMasterCPUMin, err = strconv.Atoi(line[1])
        check(err)
      case 19:
        custom.ComputeMasterMemMax, err = strconv.Atoi(line[1])
        check(err)
      case 20:
        custom.ComputeMasterMemMin, err = strconv.Atoi(line[1])
        check(err)
      case 21:
        custom.ComputeWorkerCPUMax, err = strconv.Atoi(line[1])
        check(err)
      case 22:
        custom.ComputeWorkerCPUMin, err = strconv.Atoi(line[1])
        check(err)
      case 23:
        custom.ComputeWorkerMemMax, err = strconv.Atoi(line[1])
        check(err)
      case 24:
        custom.ComputeWorkerMemMin, err = strconv.Atoi(line[1])
        check(err)
      case 25:
        custom.Database = line[1]
      case 26:
        i = i - 1
        if(line[1] != "None" && line[0] == "OpenPort"){
          a, err = strconv.Atoi(line[1])
          check(err)
          custom.DatabasePorts = append(custom.DatabasePorts, a)
        }
        if(line[0] != "OpenPort") {
          custom.DatabaseCopies, err = strconv.Atoi(line[1])
          check(err)
          i = i + 1
        }
      case 27:
        custom.DatabaseSize, err = strconv.Atoi(line[1])
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
        typeOfV.Field(i).Name, f.Type(), f.Interface())
        //typeOfV.Field(i).Name, f.Type(), v.FieldByName(typeOfV.Field(i).Name))
      fmt.Println(v.FieldByName(typeOfV.Field(i).Name).Type())
      fmt.Println(f.CanInterface())
      writeVariable("Output.txt", typeOfV.Field(i).Name, f.Interface())
    }

}




