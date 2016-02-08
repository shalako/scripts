#! /bin/bash
VERSION=$1

echo 'Downloading latest stable...'
wget https://github.com/cloudfoundry-incubator/routing-api-cli/releases/download/$VERSION/rtr-darwin-amd64.tgz 

echo 'Uncompressing...'
tar -xf rtr-darwin-amd64.tgz 

echo 'Moving binary to /usr/local/bin/rtr...'
mv rtr /usr/local/bin/rtr

echo 'Deleting tarball...'
rm rtr-darwin-amd64.tgz 
