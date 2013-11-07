#! /bin/bash

echo 'Downloading latest binary'
wget http://go-cli.s3.amazonaws.com/go-cf-darwin-amd64.tgz

echo 'Uncompressing...'
tar -xf go-cf-darwin-amd64.tgz 

echo 'Moving binary to /usr/local/bin/'
mv go-cf /usr/local/bin/

echo 'Deleting the tarball'
rm go-cf-darwin-amd64.tgz 
