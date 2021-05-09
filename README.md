[![Circle CI](https://circleci.com/gh/staticnotdynamic/udacity-proj3.svg?style=svg)]()


## Overview

A simple project to deploy a machine learning based API on Kubernetes. The machine learning part is handed out as complete, with a pre-trained model and a dataset readily taken from [Kaggle](https://www.kaggle.com/c/boston-housing). The API itself is written in Python [Flask](https://flask.palletsprojects.com/) and is containerized with the Docker container runtime

## Running
A Quick explanation of each file provided:

```
├── Dockerfile		# commands and directives used by the docker container runtime
├── Makefile		# targets for "make"
├── README.md		# project description and getting started
├── app.py		# main application entrance
├── deployment.yaml	# description of the deployment needed by Kubernetes
├── make_prediction.sh	# run this to test a local installation of yours on port 8000 (default)
├── model_data		# the dataset used by the pre-trained model
│   ├── boston_housing_prediction.joblib
│   └── housing.csv
├── output_txt_files	# output files required for submission
│   ├── docker_out.txt
│   └── kubernetes_out.txt
├── requirements.txt	# used by the python package manager to setup all dependencies
├── run_docker.sh	# run inside a docker container
├── run_kubernetes.sh	# run inside a kubernetes cluster
└── upload_docker.sh	# uploads an image built by running `run_docker.sh` to Docker Hub
```

The following instructions are provided solely for Linux. First, [setup the environment](#setup_the_environment) with virtualenv, [run](#running_app.py) the project, then in a separate terminal window type:
```bash
./make_predictions.sh
```
to query the API for a single prediction. The input data format is JSON. See the Kaggle link for explanation of each field

### Setup the Environment

* Create a Python 3 virtualenv and activate it:
	* `python3 -m venv venv`
	* `source venv/bin/activate`
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in a Docker container:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

## Testing
So far, no actual tests are provided other than linting. Run `make lint` from within the project directory. You need pylint (`pip install pylint`) if you would like to run python liniting tests

## Notes
There are tiny deriviations from the expected project outcome mentioned at the course page, namely:
1. Private image at Docker Hub was used
2. A declarative `deployment.yaml` file for Kubernetes was created, instead of specifying `--image` parameter, as it wasn't possible to specify the `imagePullSecrets` parameter via the CLI. The parameter is needed to pull the image from the private docker hub repository
3. A deployment (not pod) was created
