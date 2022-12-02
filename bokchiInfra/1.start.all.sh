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

echo "run container @docker-composer by the current user"
BOKCHI_ID=$(id -u):$(id -g) docker-compose up -d




