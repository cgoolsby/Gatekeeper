#kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml
kubectl proxy --port=8080 --address='0.0.0.0' --disable-filter=true &

aws-iam-authenticator token -i cluster-name
echo "Copy and paste the Token into the kubernetes webpage: http://localhost:8080"  #/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/"
#kubectl proxy
