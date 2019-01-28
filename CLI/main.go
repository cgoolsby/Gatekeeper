package main
import (
  "fmt"
  "os"
  "log"
  "strings"
  "strconv"
  "bufio"
)

var fileName = "test.yml"

// give user a list of options, then write that option to the yml
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
  }
}
// write two options seperated by a colon
func writeYml(fileName, opt1, opt2 string) {
  write := (opt1 + ": " + opt2 + "\n")
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

func main() {
  //Kubernetes Cluster Parameters
  InstanceTypes := []string{"t2.micro", "t2.medium", "m4.large"} //More to be added later, better way to get these in?
  name := "InstanceType"
  selectOption(name, InstanceTypes)
  fmt.Println("How many nodes would you like in your Kubernetes Cluster?")
  number := readNumber()
  writeYml(fileName, "Nodes", strconv.Itoa(number))

  //Ingestion System
  IngestionSystem := []string{"None", "Zookeeper.Kafka", "Pulsar"}
  name = "IngestionSystem"
  selectOption(name, IngestionSystem)
  portsOpen(name)

  //Compute Cluster
  ComputeCluster := []string{"None", "Hadoop.Spark", "Flink", "Presto", "Pelican"}
  name = "ComputeCluster"
  selectOption(name, ComputeCluster)
  portsOpen(name)

  //Database
  DataBase := []string{"None", "mySQL", "Postgres", "Cassandra", "MongoDB"}
  name = "SparkDatabase"
  selectOption(name, DataBase)
  portsOpen(name)

  //Extra EC2 Instances
  EC2 := []string{"None", "1", "2", "3", "4", "5"}
  name = "ExtraEC2"
  selectOption(name, EC2)
  portsOpen(name)
}
