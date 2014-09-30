#!/bin/bash
start_val=1
end_val=10000
db_password=
db_name=mydb
table_name=mytable

for i in `seq $start_val $end_val`; do
  echo "statement $i"
  mysql -p$db_password -e"use $db_name; select count(*) from $table_name;"
  sleep 0.1
done
