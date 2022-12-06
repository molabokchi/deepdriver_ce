#!/bin/bash


main() {

  echo -e "\n🧿 Running Bokchi package"

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

  echo -e "\n❇ 2. up containers"
  BOKCHI_ID=$(id -u):$(id -g) docker-compose up -d

  echo -e "\n❇ 3. provisioning"
  #for (( i = 0; i <= ${TOTAL_CNT}; i=$i + 1)); do
  #  progress_bar "$i"
  #  sleep 0.1;
  #done
  until docker exec -it infra_mgr bash -c "ls /home/scripts" | grep -q "bokchi_1"
  do
    progress_bar "5" "provisioning ready"
    sleep 0.3
  done
  until docker exec -it infra_mgr bash -c "ls /home/scripts" | grep -q "bokchi_2"
  do
    progress_bar "10" "checked & creating @rdb"
    sleep 0.3
  done
  until docker exec -it infra_mgr bash -c "ls /home/scripts" | grep -q "bokchi_3"
  do
    progress_bar "15" "checked & creating @nosql"
    sleep 0.3
  done
  until docker exec -it infra_mgr bash -c "ls /home/scripts" | grep -q "bokchi_4"
  do
    progress_bar "20" "checked & creating @gitlab"
    sleep 0.3
  done
  until docker exec -it infra_mgr bash -c "ls /home/scripts" | grep -q "bokchi_5"
  do
    progress_bar "25" "create service user"
    sleep 0.3
  done
  progress_bar "done" "ok"

  echo -e "\n❇ 4. docker container status"
  docker-compose ps -a
  echo -e "\n❇ 5. completed successfully\n"
  echo -e " This packaging is used for bokchi deepdriver."
  echo -e " If there is some question or bug report,"
  echo -e " feel free and contact us, support@bokchi.com"
  echo -e " Enjoy it!\n"

  exit 0
}

progress_bar() {
  TOTAL_CNT=30
  if [ "$1" == "done" ]; then
    spinner="🙆"
    percent_done="${TOTAL_CNT}: $2"
    progress_message="Done!"
    new_line="\n"
  else
    #spinner='/-\|'
    spinner='🙇🙋💁🙆'
    percent_done="${1:-0}"
    progress_message="$percent_done/${TOTAL_CNT}: $2"
  fi

  percent_none="$(( ${TOTAL_CNT} - $percent_done ))"
  [ "$percent_done" -gt 0 ] && local done_bar="$(printf '▉%.0s' $(seq -s ' ' 1 $percent_done))"
  [ "$percent_none" -gt 0 ] && local none_bar="$(printf '▒%.0s' $(seq -s ' ' 1 $percent_none))"

  # print the progress bar to the screen
  printf "\r Step: [%s%s] %s %s${new_line}" \
    "$done_bar" \
    "$none_bar" \
    "${spinner:x++%${#spinner}:1}" \
    "$progress_message"
}

main "$@"


