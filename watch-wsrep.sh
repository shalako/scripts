#!/bin/bash
db_host=$1
root_pw="--login-path=local"

mysql $root_pw -h $db_host -u root -e "show status where variable_name in ('wsrep_local_state_comment','wsrep_cluster_size','wsrep_cluster_status');"
