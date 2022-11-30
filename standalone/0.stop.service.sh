#!/bin/bash

echo "Stoping service"
docker-compose stop \
	service.apimicro \
	service.usermicro \
	service.expermicro \
	service.mesgmicro \
	service.resormicro \
	publisher.board

echo "successfully done"
