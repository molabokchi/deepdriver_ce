#!/bin/bash

echo -e "\n❇ stop api micro-service"
docker stop micro_api 

echo -e "\n❇ clear micro-service"
docker rmi -f \
  $( \
    docker images --format "{{.ID}} {{.Repository}} "\
    | grep 'micro_api' \
    | awk '{print $1}' \
  )


echo -e "\n restart micro-services"
cd ../
./1.start.all.sh

