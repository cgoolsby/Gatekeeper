#Goals
1) Learn some GO
2) Make a CLI to guide user in making their pipeline



#How the Pipeline should look
1) Friendly
2) Should give numeric optionsi where possible
  a) Select each of the following
    i)   Ingestion System
    ii)  Computation Cluster
    iii) Database type
  b) for each selection
    i)   Lower/Upper for resources - cpu/mem/storage
    ii)  number of each instance, i.e. 1 master 3 workers
  c) What Nodes to put this on (i.e. 3 m4.large)
  d) the keyname/path for their AWS account
  e) do they want a webserver? - point it to a github link
  f) do they want monitoring? if time, what type of monitoring
  e) probably some other variable I am forgetting about
