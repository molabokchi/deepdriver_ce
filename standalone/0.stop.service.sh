#!/bin/bash

echo -e "\nStopping service (backend)"
# service.mesgmicro
docker-compose stop \
	service.apimicro \
	service.usermicro \
	service.expermicro \
	service.resormicro

echo "successfully done"
