#!/bin/bash

echo -e "\n❇ stop experiment micro-service"
# micro_mesg
docker stop micro_experiment

echo -e "\n❇ clear micro-service image"
docker rmi -f \
  $( \
    docker images --format "{{.ID}} {{.Repository}} "\
    | grep 'micro_experiment' \
    | awk '{print $1}' \
  )


echo -e "\n restart micro-service"
cd ../
./1.start.all.sh

