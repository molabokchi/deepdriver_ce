#!/bin/bash

echo "make directories"
mkdir ./_logs
mkdir ./storage


echo "up container by the current user"

BOKCHI_ID=$(id -u):$(id -g) docker-compose up -d

docker-compose ps -a




