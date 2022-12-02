#!/bin/bash

# make
echo -e "\n❇ 1. check environment"
DIR_LOG=./_logs
if [[ -d "${DIR_LOG}" ]]; then
echo "${DIR_LOG} already existed"
else
echo "make ${DIR_LOG}"
mkdir ${DIR_LOG}
fi
DIR_STG=./storage
if [[ -d "${DIR_STG}" ]]; then
echo "${DIR_STG} already existed"
else
echo "make ${DIR_STG}/.ssh"
echo "make ${DIR_STG}/fs"
mkdir -p ${DIR_STG}/.ssh
mkdir -p ${DIR_STG}/fs
fi

echo -e "\n❇ 2. run container @docker-composer by the current user"
BOKCHI_ID=$(id -u):$(id -g) docker-compose up -d

echo -e "\n docker container status"
docker-compose ps -a
echo -e "\n❇ 4. completed successfully\n"
echo -e "\n This packaging is used for bokchi deepdriver."
echo -e "\n If there is some question or bug report,"
echo -e "\n feel free and contact us, support@bokchi.com"
echo -e "\n\n Enjoy it!\n"

exit 0
