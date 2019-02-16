#!/bin/bash

#take in the parameters, use them to kubectl up an ingestion system w/ the designated name.

name=$1; shift
if [ $name == "None" ]
then
  exit
fi
next=$1; shift
ports=()
while [ $next != "PortEnd" ]
do
  ports[${#ports[@]}]=$next
  next=$1; shift
  echo "got a port $next"
done
databaseCopies=$1; shift
databaseSize=$1; shift
#sed -i 's/DATABASECOPIES/$databaseCopies/g' *.yml
#sed -i 's/DATABASESIZE/$databaseSize/g' *.yml
for i in `ls database/$name/*.yml`; do kubectl create -f $i; done
#Port Forwarding Logic here? i.e. for loop through the array, open ports.  Seems difficult to target each instance after creation?

