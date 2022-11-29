#!/bin/bash

# make
echo "make directories"
mkdir ./_logs
mkdir ./storage

echo "run container @docker-composer by the current user"
BOKCHI_ID=$(id -u):$(id -g) docker-compose up -d


