package main
import (
  "fmt"
  "os"
  "log"
  "strings"
  "strconv"
)



var fileName = "test.yml"



func selectOption(name string, options []string) {
  fmt.Println("Which ", name, "would you like?")
  for i, j := range options {
    fmt.Println(i, ") ", j)
  }
  var input int
  fmt.Scanln(&input)
  var selection = options[input]
  fmt.Println("You selected : ", selection)
  writeYml(fileName, name, selection)
}
func check(e error) {
    if e != nil {
        panic(e)
    }
}
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

// containsString returns true iff slice contains element
func containsString(slice []string, element string) bool {
	return !(posString(slice, element) == -1)
}
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
func portsOpen(name string) {
  fmt.Println("Are there any specific ports you would like open for ", name)
  if(askForConfirmation()) {
    fmt.Println("Please type the ports you want open.  Seperate them with a space")
    var portsString string
    _, err := fmt.Scanln(&portsString)
    if err != nil {
      log.Fatal(err)
    }
    var n []int = numbers(portsString)
    for _ , i := range n {
      writeYml(fileName, "OpenPort", strconv.Itoa(i))
    }
  }
}

func writeYml(fileName, opt1, opt2 string) {
  write := (opt1 + ": " + opt2 + "\n")
  //write := []byte(opt1 + ": " + opt2 + "\n")
  //err := ioutil.WriteFile(fileName, write, 0644)
  //check(err)
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









func main(){
 
  // Ingestion System
  IngestionSystem := []string{"None", "Zookeeper.Kafka", "Pulsar"}
  name := "IngestionSystem"
  selectOption(name, IngestionSystem)
  portsOpen(name)

  //Compute Cluster
  ComputeCluster := []string{"None", "Hadoop.Spark", "Flink", "Presto", "Pelican"}
  name = "ComputeCluster"
  selectOption(name, ComputeCluster)

  //Database
  DataBase := []string{"None", "mySQL", "Postgres", "Cassandra", "MongoDB"}
  name = "SparkDatabase"
  selectOption(name, DataBase)


  //Extra EC2 Instances
  EC2 := []string{"None", "1", "2", "3", "4", "5"}
  name = "ExtraEC2"
  selectOption(name, EC2)
}
