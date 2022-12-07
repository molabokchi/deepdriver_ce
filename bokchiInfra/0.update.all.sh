#!/bin/bash

echo -e "\n❇ 1. down all container"
BOKCHI_ID=$(id -u):$(id -g) docker-compose down

echo -e "\n❇ 2. refresh all docker images"
docker rmi -f $(docker images -aq)


./1.start.all.sh

