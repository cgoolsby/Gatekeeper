kubectl apply -f ~/Desktop/prometheus-operator/contrib/kube-prometheus/manifests/ #instantiate prometheus operator, path is to prometheus operator which was git pulled
kubectl get pods --namespace monitoring
kubectl get svc --namespace monitoring                                            #ensure services are up


echo "Now you need to wait for these services to start.  $ kubectl get pods --namespace monitoring and $ kubectl get svc --namespace monitoring"
echo "Then you will run these two commands in seperate terminal windows.  *Experience dictates that you should not run them in background*"
echo " $ kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090              #start prometheus on localhost:9090"
echo " $ kubectl port-forward $(kubectl get  pods --selector=app=grafana -n  monitoring --output=jsonpath="{.items..metadata.name}") -n monitoring  3000  #start grafana on localhost:3000, default password admin/admin"

###kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090              #start prometheus on localhost:9090
###kubectl port-forward $(kubectl get  pods --selector=app=grafana -n  monitoring --output=jsonpath="{.items..metadata.name}") -n monitoring  3000  #start grafana on 3000, default password admin/admin


