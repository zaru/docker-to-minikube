```
docker build -t docker-to-minikube .
```

```
docker run --rm -it --name docker-to-minikube \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd)/minikube:/minikube \
  docker-to-minikube
```
