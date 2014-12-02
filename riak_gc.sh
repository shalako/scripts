#! /bin/bash

data_dir=~/workspace/tmp

for n in $(seq 1 10); do
	s3cmd put $data_dir/1gb.txt s3://scoen
	s3cmd del s3://scoen/1gb.txt 
done
