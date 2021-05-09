#!/usr/bin/env bash

# This is your Docker ID/path
#dockerpath=staticnotdynamic/udacity-proj3
#token_name=dockerhub-token

# Run the Docker Hub container with kubernetes
# Pulling images from a private repository: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
# deployment.yaml file was created as to specify imagePullSecrets
kubectl apply -f deployment.yaml

# List kubernetes pods
kubectl get pods

# Forward the container port to a host
# TODO: write it declarively in the deployment.yaml file
## Create a service for a pod identified by type and name specified in deployment.yaml, with container-port of 80 and host port of 8000
# kubectl expose -f deployment.yaml --type=NodePort --port=8000 --target-port=80
# Listen on port 8888 locally, forwarding to 5000 in the pod
kubectl port-forward deployment/udacity-proj3-deployment 8000:80
