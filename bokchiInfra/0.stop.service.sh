#!/bin/bash

echo -e "\nStopping service (backend)"
docker-compose stop \
	service.apimicro \
	service.usermicro \
	service.expermicro \
	service.resormicro \
    service.mesgmicro

echo "successfully done"




