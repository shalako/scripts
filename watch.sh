#!/bin/bash
root_pw=

mysql -p$root_pw -e "show status where variable_name in ('wsrep_local_state_comment','wsrep_cluster_size','wsrep_cluster_status');"
