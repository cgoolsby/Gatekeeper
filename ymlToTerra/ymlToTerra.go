package main

import (
  "fmt"
  "bufio"
  "io"
  "io/ioutil"
  "os"
)

fileName = "test.yml"

type Pair struct {
  opt1 string
  opt2 string
}
type PortOpen struct {
  opt1 string
  opt2 string
}

func check(e error) {
    if e != nil {
        panic(e)
    }
}



    scanner := bufio.NewScanner(os.Stdin)
    if scanner.Scan() {
      portsString := scanner.Text()


      reader := bufio.NewReader(


func main() {
  f, err := os.Open(fileName)
  
