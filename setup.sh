#!/bin/bash

## Build the base image
./buildBaseImage.sh

## Build some utility images
docker build -t pdcnode DockerFiles/Node/
docker build -t pdcnatman DockerFiles/NatMan/

