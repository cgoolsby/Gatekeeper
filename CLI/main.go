package main
import (
  "fmt"
  "os"
  "log"
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
