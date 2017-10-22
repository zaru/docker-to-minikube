#!/bin/bash

if type minikube >/dev/null 2>&1; then
  echo "already exists minikube"
else
  echo "installing minikube..."
  brew cask install minikube
fi

minikube start --vm-driver="virtualbox" --insecure-registry=192.168.99.100:80

cp ~/.minikube/client.crt ./minikube/client.crt
cp ~/.minikube/client.key ./minikube/client.key
cp ~/.minikube/ca.crt     ./minikube/ca.crt
cp -r ~/.minikube/certs   ./minikube/

docker build -t docker-to-minikube:latest .
