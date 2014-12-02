#!/bin/bash
db_host=$1
db_password=password
db_name=mydb
table_name=mytable
start_val=1
end_val=10000

mysql -h $db_host -u root -p$db_password -e"create database if not exists $db_name;"
mysql -h $db_host -u root -p$db_password -e"use $db_name; create table if not exists $table_name (val int);"

for i in `seq $start_val $end_val`; do
  echo "inserting $i"
  mysql -h $db_host -u root -p$db_password -e"use $db_name; insert into $table_name VALUES ($i); select count(*) from $table_name;"
  sleep 0.1
done
