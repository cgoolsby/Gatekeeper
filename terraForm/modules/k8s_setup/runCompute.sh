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
#  echo "got a port $next"
done
master=$1; shift
worker=$1; shift
masterCPUMax=$1; shift
masterCPUMin=$1; shift
masterMemMax=$1; shift
masterMemMin=$1; shift
workerCPUMax=$1; shift
workerCPUMin=$1; shift
workerMemMax=$1; shift
workerMemMin=$1; shift

rm -rf compute/current/
mkdir compute/current/
cp -r compute/$name/* compute/current/*

sed -i'' 's/MASTER/$master/g' compute/current/*.yml
sed -i'' 's/WORKER/$worker/g' compute/current/*.yml
sed -i'' 's/MASTERCPUMAX/$masterCPUMax/g' compute/current/*.yml
sed -i'' 's/MASTERCPUMIN/$masterCPUMin/g' compute/current/*.yml
sed -i'' 's/MASTERMEMMAX/$masterMemMax/g' compute/current/*.yml
sed -i'' 's/MASTERMEMMIN/$masterMemMin/g' compute/current/*.yml
sed -i'' 's/WORKERCPUMAX/$workerCPUMax/g' compute/current/*.yml
sed -i'' 's/WORKERCPUMIN/$workerCPUMin/g' compute/current/*.yml
sed -i'' 's/WORKERMEMMAX/$workerMemMax/g' compute/current/*.yml
sed -i'' 's/WORKERMEMMIN/$workerMemMin/g' compute/current/*.yml
for i in `ls compute/current/*.yml`; do kubectl create -f $i; done
#Port Forwarding Logic here? i.e. for loop through the array, open ports.  Seems difficult to target each instance after creation?

