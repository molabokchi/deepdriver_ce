#!/bin/bash

echo -e "\n[CAUTION] All data(database, log, images) will be deleted."
read -r -p " Are you sure? [y/N]" response
response=${response,,} # tolower
if [[ $response =~ ^(y| ) ]]; then
  echo -e "\nstop all container"
  docker-compose stop
  docker rm $(docker ps -aq)

  echo -e "\ndelete all docker images"
  docker rmi -f $(docker images -aq)

  echo -e "\ndelete all directories"
  sudo rm -rf _data
  sudo rm -rf _logs
  sudo rm -rf storage
fi

