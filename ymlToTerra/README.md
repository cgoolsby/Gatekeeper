Quite simple,  take in yml created by the CLI tool, use it to configure files, open correct ports, and turn stuff on/off


goals, read yaml into variables, i.e. structs :
type Pair struct {
    opt1 string
    opt2 string
}

and 
type portList struct {
  opt1 string
  opt2 []int 
}  

Finally: use this to fill out tfvars files, and copy over the correct yml files from the k8s folder.  These will be used with kubectl create, and port openings to make the final configuration.
