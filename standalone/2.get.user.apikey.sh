#!/bin/bash

echo -e "\nGet user api information"
docker exec -it infra_mgr bash -c "cat /home/scripts/result.txt"

echo "successfully done"
