#!/bin/bash

read -r -p "Are you sure? [y/N]" response
 response=${response,,} # tolower
 if [[ $response =~ ^(y| ) ]]; then
    echo "gogo"
 fi


