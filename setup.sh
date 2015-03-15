#!/bin/bash

## Make sure we have the latest software running
apt-get update && apt-get dist-upgrade -y

## Install some additional software
apt-get install git -y

## Get the rest of the code
git clone https://github.com/mikeholczer/pdc.git
cd pdc

## Build the base image
./buildBaseImage.sh

## Build some utility images
docker build -t pdcpython DockerFiles/Python/
