#!/bin/bash
db_host=$1
root_pw="--login-path=local"

mysql $root_pw -h $db_host -u root -e "show processlist;"
