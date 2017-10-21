## Build

```
./setup.sh
```

or

```
docker build -t docker-to-minikube .
```

## Run

```
docker run --rm -it --name docker-to-minikube \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd)/minikube:/minikube \
  docker-to-minikube
```

```
kubectl get all
```
