## Build

```
./setup.sh
```

## Run

```
docker run --rm -it --name docker-to-minikube \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd)/minikube:/minikube \
  docker-to-minikube
```

in docker-tominikube container.

```
kubectl get all
```

build and run to sample container for kubernetes.

```
cd containers
docker build -t nginx-sample:v0.0.1 .
kubectl create -f kubernetes.yaml
```
