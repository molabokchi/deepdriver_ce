#!/bin/bash

  echo "## Running Bokchi "

  echo -e "\n check environment"
  DIR_LOGS=./_logs
  if [ -f "$DIR_LOGS" ]; then
    echo "existed"
  else
    echo "not existed"
  fi
