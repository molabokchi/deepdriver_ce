#!/bin/bash

docker-compose stop

docker rm $(docker ps -aq)

docker rmi -f $(docker images -aq)

sudo rm -rf _data

