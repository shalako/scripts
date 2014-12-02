#!/bin/bash
db_host=$1
root_pw="--login-path=local"
MAX_PARALLEL_CONNECTIONS=100

for i in $(seq 1 10000); do
  echo -n "creating $MAX_PARALLEL_CONNECTIONS parallel connections... "
  for j in $(seq 1 $MAX_PARALLEL_CONNECTIONS); do
    mysql $root_pw -h $db_host -u root -e "show databases; select sleep(7)" >> /dev/null &
  done
  echo "done"
  sleep 9
done
