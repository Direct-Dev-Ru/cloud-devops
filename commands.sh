kubectl create deployment time-service --image=kuznetcovay/time-service-img:0.1.0 --dry-run=client -o yaml ml > ./k8s/deployment.yaml

kubectl create -f ./k8s/deployment.yaml

kubectl expose deployment time-service --port=8080 --type=NodePort --dry-run=client -o yaml > ./k8s/service.yaml

kubectl create -f ./k8s/service.yaml

