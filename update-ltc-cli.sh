#! /bin/bash

echo 'Downloading latest ltc'
curl https://lattice.s3.amazonaws.com/releases/latest/darwin-amd64/ltc -o /usr/local/bin/ltc

echo 'Fixing permissions'
chmod +x /usr/local/bin/ltc
