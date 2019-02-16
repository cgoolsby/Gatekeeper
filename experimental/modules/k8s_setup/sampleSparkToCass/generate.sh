#!/usr/bin/bash

i=0
while [ $i -lt 10000000 ]
do
  echo "REVISION 4781981 72390319 Steven_Strogatz 2006-08-28T14:11:16Z SmackBot 433328" >> test2.txt
  i=$((i+1))
  echo $i
done
