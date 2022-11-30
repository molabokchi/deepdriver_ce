#!/bin/bash

echo -e "\nStarting service (backend)"
# service.mesgmicro
docker-compose start \
	service.apimicro \
	service.usermicro \
	service.expermicro \
	service.resormicro 

echo "successfully done"
