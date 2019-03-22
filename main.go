package main
import (
  "fmt"
  "os"
  "log"
  "strings"
  "strconv"
  "bufio"
//  "os/exec"
)


//As of right now, this is a VERY BASIC CLI interface that was created to meet the deadlines of Insight.  Proof in concept really.


// output filename - variables_override.tf
var fileName = "variables_override.tf"

// give user a list of options, then write that option to the yml
func selectOption(name string, options []string) (int){
  fmt.Println("Which ", name, "would you like?")
  for i, j := range options {
    fmt.Println(i, ") ", j)
  }
  var input int
  fmt.Scanln(&input)
  var selection = options[input]
  fmt.Println("You selected : ", selection)
  writeYml(fileName, name, selection)
  if(input==0){return 0
  }else{return 1}
}
func check(e error) {
    if e != nil {
        panic(e)
    }
}

//ask for a yes or no response
func askForConfirmation() bool {
	var response string
	_, err := fmt.Scanln(&response)
	if err != nil {
		log.Fatal(err)
	}
	okayResponses := []string{"y", "Y", "yes", "Yes", "YES"}
	nokayResponses := []string{"n", "N", "no", "No", "NO"}
	if containsString(okayResponses, response) {
		return true
	} else if containsString(nokayResponses, response) {
		return false
	} else {
		fmt.Println("Please type yes or no and then press enter:")
		return askForConfirmation()
	}
}

// posString returns the first index of element in slice.
// If slice does not contain element, returns -1.
func posString(slice []string, element string) int {
	for index, elem := range slice {
		if elem == element {
			return index
		}
	}
	return -1
}

//containsString returns true iff slice contains element
func containsString(slice []string, element string) bool {
	return !(posString(slice, element) == -1)
}

//split string input of numbers and place into a slice
func numbers(s string) []int {
    var n []int
    for _, f := range strings.Fields(s) {
        i, err := strconv.Atoi(f)
        if err == nil {
            n = append(n, i)
        }
    }
    return n
}
//Check which ports the user wants open for a specific instance
func portsOpen(name string) {
  fmt.Println("Are there any specific ports you would like open for ", name)
  if(askForConfirmation()) {
    fmt.Println("Please type the ports you want open.  Seperate them with a space")
    var n []int
    scanner := bufio.NewScanner(os.Stdin)
    if scanner.Scan() {
      portsString := scanner.Text()
      n = numbers(portsString)
    }
    for _ , i := range n {
      writeYml(fileName, "OpenPort", strconv.Itoa(i))
    }
  }else{writeYml(fileName, "OpenPort", "None")}
}
func skipPorts(name string) {
  writeYml(fileName, "OpenPort", "None")
}
// write two options seperated by a colon
func writeYml(fileName, opt1, opt2 string) {
  write := ("variable \"" + opt1 + "\" {\n  default = \"" + opt2 + "\"\n}")
  f, err := os.OpenFile(fileName, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
  if err != nil {
    log.Fatal(err)
  }
  if _, err := f.Write([]byte(write)); err != nil {
    log.Fatal(err)
  }
 if err := f.Close(); err != nil {
   log.Fatal(err)
 }
}
//Read a number from STDIN
func readNumber() (number int) {
    fmt.Scanln(&number)
    if(0<number && number<50) {
      fmt.Println("You selected ", number, " nodes")
    }else{
      fmt.Println("Something seemed to not have worked, try again!")
      return readNumber()
    }
    return number
  }
func CPU_Mem_Max_Min(name string) {
  var input int
  options := []string{"CPUMax", "CPUMin", "MemMax", "MemMin"}
  for _, j := range options {
    fmt.Println("What is the", j, " for the ", name)
    fmt.Scanln(&input)
    writeYml(fileName, name+j, strconv.Itoa(input))
  }
}
func skipCPU_Mem(name string) {
  options := []string{"CPUMax", "CPUMin", "MemMax", "MemMin"}
  for _, j := range options {
    writeYml(fileName, name+j, "0")
  }
}
func main() {
  //Kubernetes Cluster Parameters
  //kubeNodeType
  InstanceTypes := []string{"t2.micro", "t2.medium", "m4.large"} //More to be added later, better way to get these in?
  name := "KubeNodeType"
  selectOption(name, InstanceTypes)
  //kubeNodes
  fmt.Println("How many nodes would you like in your Kubernetes Cluster?")
  number := readNumber()
  writeYml(fileName, "KubeNodes", strconv.Itoa(number))

  //Ingestion System
  //ingestion
  IngestionSystem := []string{"None", "kafka", "pulsar", "rabbitMQ"}
  name = "Ingestion"
  c := selectOption(name, IngestionSystem)
  if(c!=0){
  writeYml(fileName, "ingestion_exists", "1")
  //ingestionPorts
  portsOpen(name)
  //numberofMasters
  writeYml(fileName, "Master", "1")
  //numberofWorkers
  writeYml(fileName, "Worker", "3")
  //ingestionMastermin/max
  CPU_Mem_Max_Min("IngestionMaster")
  //ingestionWorkerMin/Max
  CPU_Mem_Max_Min("IngestionWorker")
}else{
  writeYml(fileName, "IngestionMaster", "0")
  writeYml(fileName, "IngestionWorker", "0")
  skipPorts(name)
  skipCPU_Mem(name)
  skipCPU_Mem(name)
}
  //Compute Cluster
  //compute
  ComputeCluster := []string{"None", "spark", "flink", "presto"}
  name = "Compute"
  c =selectOption(name, ComputeCluster)
  if(c!=0){
  writeYml(fileName, "compute_exists", "1")
  //computePorts
  portsOpen(name)
  //numberofMasters
  writeYml(fileName, "Master", "1")
  //numberofWorkers
  writeYml(fileName, "Worker", "3")
  //computeMasterMin/Max
  CPU_Mem_Max_Min("ComputeClusterMaster")
  //computeWorkerMin/Max
  CPU_Mem_Max_Min("ComputeClusterWorker")
}else{
  writeYml(fileName, "Master", "0")
  writeYml(fileName, "Worker", "0")
  skipPorts(name)
  skipCPU_Mem(name)
  skipCPU_Mem(name)
}
  //Database
  DataBase := []string{"None", "mySQL", "postgres", "postGIS", "cassandra", "mongoDB"}
  name = "Database"
  //database
  c = selectOption(name, DataBase)
  if(c!=0){
  writeYml(fileName, "database_exists", "1")
  //database ports
  portsOpen(name)
  //database number
  fmt.Println("How many Databases would you like in your Kubernetes Cluster?")
  number = readNumber()
  writeYml(fileName, "DatabaseCopies", strconv.Itoa(number))
  //database size
  fmt.Println("What size in GB would you like each database to be?")
  number = readNumber()
  writeYml(fileName, "DatabaseSize", strconv.Itoa(number))
}else{
  skipPorts(name)
  writeYml(fileName, "DatabaseCopies", "0")
  writeYml(fileName, "DatabaseSize", "0")
}

  //Extra EC2 Instances
  
  EC2 := []string{"0", "1", "2", "3", "4", "5"}
  name = "EC2num"
  //EC2num
  c =selectOption(name, EC2)
  if(c!=0){
  //EC2type
  selectOption("EC2type", InstanceTypes)
  //EC2Ports
  portsOpen(name)
}else{
  writeYml(fileName, name, "None")
  skipPorts(name)
}
}
