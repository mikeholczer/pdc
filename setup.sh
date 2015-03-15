#!/bin/bash

## Make sure we have the latest software running
apt-get update && apt-get dist-upgrade -y

## Install some additional software
apt-get install git docker.io -y
