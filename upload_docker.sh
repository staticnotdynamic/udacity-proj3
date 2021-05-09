#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
user_id=staticnotdynamic
proj_name=udacity-proj3
dockerpath="$user_id/$proj_name"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Login to Docker Hub and push image to a docker repository
docker login --username $user_id
docker push $dockerpath
