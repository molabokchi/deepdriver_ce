#!/bin/bash

echo -e "\n[CAUTION] All data(database, log, images) will be deleted."
read -r -p " Are you sure? [y/N]" response
response=${response,,} # tolower
if [[ $response =~ ^(y| ) ]]; then
  echo -e "\n❇ 1. down all container"
  BOKCHI_ID=$(id -u):$(id -g) docker-compose down

  echo -e "\n❇ 2. delete all docker images"
  docker rmi -f $(docker images -aq)

  echo -e "\n❇ 3. delete used directories"
  sudo rm -rf _data
  sudo rm -rf _logs
  sudo rm -rf storage

  echo -e "\nuninstalled successfully\n"
  echo -e " This packaging is used for bokchi deepdriver."
  echo -e " If there is some question or bug report,"
  echo -e " feel free and contact us, support@bokchi.com"
  echo -e " Thanks!\n"

fi

