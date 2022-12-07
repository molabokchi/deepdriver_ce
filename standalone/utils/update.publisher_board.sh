#!/bin/bash

echo -e "\n❇ stop publisher"
docker stop publisher_board

echo -e "\n❇ clear publisher image"
docker rmi -f \
  $( \
    docker images --format "{{.ID}} {{.Repository}} "\
    | grep 'publisher_board' \
    | awk '{print $1}' \
  )


echo -e "\n restart publisher"
cd ../
./1.start.all.sh

