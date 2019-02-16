kubectl cp CsTable.cql cassandra-0:/
kubectl exec cassandra-0 -i -t -- bash -c 'cqlsh < CsTable.cql; cqlsh -e "describe tables;"'


for i in 0 1 2; do

  echo "Cassandra Instance $i table description : "; 
  kubectl exec cassandra-$i -i -t -- bash -c 'cqlsh -e "describe tables;"' | grep -A 3 ks;
done
