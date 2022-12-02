#!/bin/bash

echo -e "\n[CAUTION] All service will be initialized"
read -r -p " Are you sure? [y/N]" response
response=${response,,} # tolower
if [[ $response =~ ^(y| ) ]]; then
  echo -e "\ndown all container"
  BOKCHI_ID=$(id -u):$(id -g) docker-compose down

  echo -e "\ndelete all docker images"
  docker rmi -f $(docker images -aq)

  echo -e "\ndelete all directories"
  sudo rm -rf _data
  sudo rm -rf _logs
  sudo rm -rf storage
fi



