#!/bin/bash

docker-compose stop

docker rm $(docker ps -aq)

docker rmi $(docker images -aq)

sudo rm -rf _data

