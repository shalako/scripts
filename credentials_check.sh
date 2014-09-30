#! /bin/bash

cfa -u scoen+auditor@gopivotal.com -o scoen -s test

cf curl "/v2/app_events/1942f7fe-815b-44eb-af47-648849713b07?app_guid=6102a648-2807-4c63-bdab-d67aa0a3663f&inline-relations-depth=2"
cf curl "/v2/apps/f09970c8-ba31-45b7-af45-9658250d2035/summary&inline-relations-depth=2"

