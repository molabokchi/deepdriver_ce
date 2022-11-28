#!/bin/bash

BOKCHI_ID=$(id -u):$(id -g) docker-compose down

docker rm $(docker ps -aq)
docker rmi $(docker images -aq)

