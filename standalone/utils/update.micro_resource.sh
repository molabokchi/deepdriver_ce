#!/bin/bash

echo -e "\n❇ stop resource micro-service"
docker stop micro_resource

echo -e "\n❇ clear micro-service image"
docker rmi -f \
  $( \
    docker images --format "{{.ID}} {{.Repository}} "\
    | grep 'micro_resource' \
    | awk '{print $1}' \
  )


echo -e "\n restart micro-service"
cd ../
./1.start.all.sh

