#!/usr/bin/env bash

# Build image and add a descriptive tag
docker build -t staticnotdynamic/udacity-proj3 .

# List docker images
docker images

# Run flask app (maybe use -d and then `docker logs` ?)
docker run -p 8000:80 staticnotdynamic/udacity-proj3 # && echo "app is now running"
