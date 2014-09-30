#!/bin/bash

environment=$1
opsman=$2
runtime=$3

cd ~/workspace/release-engineering-automation

bundle install

echo "Destroying $environment"
bundle exec rake destroy[$environment]

echo "Deploying OpsMan"
bundle exec rake opsmgr[$environment,$opsman]

echo "Deploying ubosh from OpsMan"
bundle exec rake ubosh[$environment]

echo "Deploying Runtime"
bundle exec rake runtime[$environment,$runtime]
