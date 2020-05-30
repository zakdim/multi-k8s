docker build -t zakdim/multi-client:latest -t zakdim/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t zakdim/multi-server:latest -t zakdim/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t zakdim/multi-worker:latest -t zakdim/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push zakdim/multi-client:latest
docker push zakdim/multi-server:latest
docker push zakdim/multi-worker:latest

docker push zakdim/multi-client:$SHA
docker push zakdim/multi-server:$SHA
docker push zakdim/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=zakdim/multi-server:$SHA
kubectl set image deployments/client-deployment client=zakdim/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=zakdim/multi-worker:$SHA