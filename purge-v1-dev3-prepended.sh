#! /bin/bash

cf purge-service-offering dev3-dummy-dev -p dummy -f
cf purge-service-offering dev3-dummy -p dummy -f
cf purge-service-offering dev3-sendgrid-dev -p sendgrid -f
cf purge-service-offering dev3-cloudamqp-dev -p cloudamqp -f
cf purge-service-offering dev3-cleardb-dev -p cleardb -f
cf purge-service-offering dev3-elephantsql-dev -p elephantsql -f
cf purge-service-offering dev3-memcachedcloud-dev -p garantiadata -f
cf purge-service-offering dev3-mongolab-dev -p mongolab -f
cf purge-service-offering dev3-urbanairship -p urbanairship -f
cf purge-service-offering dev3-blazemeter -p blazemeter -f
cf purge-service-offering dev3-searchify -p searchify -f
cf purge-service-offering dev3-sendgrid -p sendgrid -f
cf purge-service-offering dev3-cleardb -p cleardb -f
cf purge-service-offering dev3-mongolab -p mongolab -f
cf purge-service-offering dev3-rediscloud -p garantiadata -f
cf purge-service-offering dev3-elephantsql -p elephantsql -f
cf purge-service-offering dev3-cloudamqp -p cloudamqp -f
cf purge-service-offering dev3-newrelic -p newrelic -f
cf purge-service-offering dev3-newrelic-dev -p newrelic -f
cf purge-service-offering dev3-loadimpact -p loadimpact -f
cf purge-service-offering dev3-rediscloud-dev -p garantiadata -f
cf purge-service-offering dev3-memcachedcloud -p garantiadata -f
cf purge-service-offering dev3-memcachier-dev -p memcachier -f
cf purge-service-offering dev3-memcachier -p memcachier -f
cf purge-service-offering dev3-searchly-dev -p searchly -f
cf purge-service-offering dev3-searchly -p searchly -f
