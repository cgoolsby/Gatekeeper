# https://imti.co/kafka-kubernetes/

#kubectl create -f ./000-namespace.yml
kubectl create -f ./110-zookeeper-service.yml
kubectl create -f ./110-zookeeper-service-headless.yml
kubectl create -f ./140-zookeeper-statefulset.yml
kubectl create -f ./150-zookeeper-disruptionbudget.yml
kubectl create -f ./210-kafka-service.yml
kubectl create -f ./210-kafka-service-headless.yml
kubectl create -f ./240-kafka-statefulset.yml
kubectl create -f ./400-test-pod.yml
