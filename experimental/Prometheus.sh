kubectl apply -f ~/Desktop/prometheus-operator/contrib/kube-prometheus/manifests/ #instantiate prometheus operator, path is to prometheus operator which was git pulled
kubectl get pods --namespace monitoring
kubectl get svc --namespace monitoring                                            #ensure services are up
kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090 &             #start prometheus on localhost:9090
kubectl port-forward $(kubectl get  pods --selector=app=grafana -n  monitoring --output=jsonpath="{.items..metadata.name}") -n monitoring  3000 & #start grafana on 3000, default password admin/admin


