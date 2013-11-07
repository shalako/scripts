#! /bin/bash

echo 'Downloading latest binary'
wget https://github.com/cloudfoundry/cli/releases/download/v6.0.0-beta/gcf-darwin-amd64.tgz

echo 'Uncompressing...'
tar -xf gcf-darwin-amd64.tgz

echo 'Moving binary to /usr/local/bin/'
mv go-cf /usr/local/bin/

echo 'Deleting the tarball'
rm gcf-darwin-amd64.tgz
