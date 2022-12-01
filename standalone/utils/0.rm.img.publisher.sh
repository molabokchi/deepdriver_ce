#!/bin/bash

MICRO_SERVICE=micro_resource
docker rmi -f \
  $( \
    docker images --format "{{.ID}} {{.Repository}} "\
    | grep ${MICRO_SERVICE} \
    | awk '{print $1}' \
  )

