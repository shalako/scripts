#!/bin/bash
MAX_PARALLEL_CONNECTIONS=100

export MYSQL_PWD=password
for i in $(seq 1 10000); do
  echo -n "creating $MAX_PARALLEL_CONNECTIONS parallel connections... "
  for j in $(seq 1 $MAX_PARALLEL_CONNECTIONS); do
    mysql -h 10.244.1.18 -u root -e "show databases; select sleep(7)" >> /dev/null &
  done
  echo "done"
  sleep 9
done
