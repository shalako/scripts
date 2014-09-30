#! /bin/bash

cf purge-service-offering cloudamqp-dev -p cloudamqp -f
cf purge-service-offering cleardb-dev -p cleardb -f
cf purge-service-offering cloudamqp -p cloudamqp -f
cf purge-service-offering cleardb -p cleardb -f
cf purge-service-offering rediscloud-dev -p garantiadata -f
cf purge-service-offering rediscloud -p garantiadata -f
cf purge-service-offering sendgrid-dev -p sendgrid -f
cf purge-service-offering sendgrid -p sendgrid -f
cf purge-service-offering elephantsql-dev -p elephantsql -f
cf purge-service-offering elephantsql -p elephantsql -f
cf purge-service-offering dummy-dev -p dummy -f
cf purge-service-offering mongolab-dev -p mongolab -f
cf purge-service-offering mongolab -p mongolab -f
cf purge-service-offering urbanairship -p urbanairship -f
cf purge-service-offering blazemeter -p blazemeter -f
cf purge-service-offering searchify -p searchify -f
cf purge-service-offering dummy -p dummy -f
cf purge-service-offering newrelic -p newrelic -f
cf purge-service-offering newrelic-dev -p newrelic -f
cf purge-service-offering memcachedcloud -p garantiadata -f
cf purge-service-offering memcachedcloud-dev -p garantiadata -f
cf purge-service-offering memcachier -p memcachier -f
cf purge-service-offering memcachier-dev -p memcachier -f
cf purge-service-offering searchly -p searchly -f
cf purge-service-offering searchly-dev -p searchly -f
cf purge-service-offering loadimpact -p loadimpact -f
