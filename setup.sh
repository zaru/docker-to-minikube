#!/bin/bash

brew cask install minikube

minikube start

cp ~/.minikube/client.crt ./minikube/client.crt
cp ~/.minikube/client.key ./minikube/client.key
cp ~/.minikube/ca.crt     ./minikube/ca.crt

docker build -t docker-to-minikube .
