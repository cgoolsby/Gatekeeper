kubectl exec kafka-test-client -- /usr/bin/kafka-topics --zookeeper kafka-zookeeper:2181 --list
echo "kubectl exec kafka-test-client -- /usr/bin/kafka-topics --zookeeper kafka-zookeeper:2181 --list"
kubectl exec kafka-test-client -- /usr/bin/kafka-topics --zookeeper kafka-zookeeper:2181 --topic test --create --partitions 1 --replication-factor 1
echo "kubectl exec kafka-test-client -- /usr/bin/kafka-topics --zookeeper kafka-zookeeper:2181 --topic test --create --partitions 1 --replication-factor 1"
kubectl exec -ti kafka-test-client -- /usr/bin/kafka-console-consumer --bootstrap-server kafka:9092 --topic test --from-beginning
echo "kubectl exec -ti kafka-test-client -- /usr/bin/kafka-console-consumer --bootstrap-server kafka:9092 --topic test --from-beginning"
