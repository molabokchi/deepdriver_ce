#!/bin/bash

echo -e "\n❇ stop all micro-services"
docker stop micro_api \
	micro_user \
	micro_experiment \
	micro_message \
	micro_resource

echo -e "\n❇ clear micro-service images"
docker rmi -f \
  $( \
    docker images --format "{{.ID}} {{.Repository}} "\
    | grep 'micro_api\|micro_user\|micro_experiment\|micro_message\|micro_resource' \
    | awk '{print $1}' \
  )


echo -e "\n restart micro-services"
./1.start.all.sh

