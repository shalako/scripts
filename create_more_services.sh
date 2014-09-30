#! /bin/bash

cf cs cleardb spark   cleardb2
cf cs cloudamqp lemur  cloudamqp2
#cf cs dummy small dummy2
cf cs elephantsql turtle elephantsql2
cf cs memcachedcloud 25mb  memcachedcloud2
#cf cs mongolab sandbox   mongolab2
cf cs rediscloud 25mb  rediscloud2
