#!/bin/bash

echo -e "\nAll container is stopping"
BOKCHI_ID=$(id -u):$(id -g) docker-compose down



