#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t staticnotdynamic/udacity-proj3 .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app (maybe use -d and then `docker logs` ?)
docker run -p 8000:80 staticnotdynamic/udacity-proj3 # && echo "app is now running"
