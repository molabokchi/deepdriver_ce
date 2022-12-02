#!/bin/bash

echo -e "\nStarting service (backend)"
docker-compose start \
	service.apimicro \
	service.usermicro \
	service.expermicro \
	service.resormicro \
    service.mesgmicro 

echo "successfully done"



