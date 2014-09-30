#! /bin/bash

echo 'Downloading latest edge'
wget http://go-cli.s3.amazonaws.com/master/cf-darwin-amd64.tgz

#echo 'Downloading latest stable'
#wget http://go-cli.s3-website-us-east-1.amazonaws.com/releases/latest/cf-darwin-amd64.tgz

echo 'Uncompressing...'
tar -xf cf-darwin-amd64.tgz 

echo 'Moving binary to /usr/local/bin/cf'
mv cf /usr/local/bin/cf

echo 'Deleting tarball'
rm cf-darwin-amd64.tgz 
