#! /bin/bash
# Run this script from the directory of the file to be uploaded
# eg.  ~/workspace/scripts/riak_gc.sh 1gb.txt service-instance-80d4ea06-c67e-4077-a500-e46030803b28

file=$1
bucket=$2

s3cmd del s3://$bucket/$file

for n in $(seq 1 10); do
	s3cmd put $file s3://$bucket
	s3cmd del s3://$bucket/$file
done
