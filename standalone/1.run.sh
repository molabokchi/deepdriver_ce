#!/bin/bash


TOTAL_CNT=50

main() {

  echo "## Running Bokchi "

  echo -e "\n - 1. check environment"
  DIR_LOGS=./_logs
  if [[ -f "$DIR_LOGS" ]]; then
    echo "existed"
  else
    echo "not existed"
  fi


  mkdir ./_logs
  mkdir ./storage

  echo -e "\n -2. up containers"
  BOKCHI_ID=$(id -u):$(id -g) docker-compose up -d

  echo -e "\n -3. terraforming"
  #for (( i = 0; i <= ${TOTAL_CNT}; i=$i + 1)); do
  #  progress_bar "$i"
  #  sleep 0.1;
  #done
  until docker exec -it infra_mgr bash -c "ls /home/scripts" | grep -q "bokchi_1"
  do
    progress_bar "5" "provisioning ready"
    sleep 0.5s
  done
  until docker exec -it infra_mgr bash -c "ls /home/scripts" | grep -q "bokchi_2"
  do
    progress_bar "10" "checked & created @rdb"
    sleep 0.5s
  done
  until docker exec -it infra_mgr bash -c "ls /home/scripts" | grep -q "bokchi_3"
  do
    progress_bar "20" "checked $ created @nosql"
    sleep 0.5s
  done
  until docker exec -it infra_mgr bash -c "ls /home/scripts" | grep -q "bokchi_4"
  do
    progress_bar "30" "checked & created @gitlab"
    sleep 0.5s
  done
  until docker exec -it infra_mgr bash -c "ls /home/scripts" | grep -q "bokchi_5"
  do
    progress_bar "40" "created service user"
    sleep 0.5s
  done
  progress_bar "done" "!"

  docker-compose ps -a
  echo -e "\n -4. completed successfully"
  exit 0
}

progress_bar() {
  if [ "$1" == "done" ]; then
    spinner="X"
    percent_done="${TOTAL_CNT}"
    progress_message="Done!"
    new_line="\n"
  else
    spinner='/-\|'
    percent_done="${1:-0}"
    progress_message="$percent_done / ${TOTAL_CNT}: $2"
  fi

  percent_none="$(( 50 - $percent_done ))"
  [ "$percent_done" -gt 0 ] && local done_bar="$(printf '#%.0s' $(seq -s ' ' 1 $percent_done))"
  [ "$percent_none" -gt 0 ] && local none_bar="$(printf '~%.0s' $(seq -s ' ' 1 $percent_none))"

  # print the progress bar to the screen
  printf "\r Progress: [%s%s] %s %s${new_line}" \
    "$done_bar" \
    "$none_bar" \
    "${spinner:x++%${#spinner}:1}" \
    "$progress_message"
}

main "$@"


