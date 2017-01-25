#!/bin/bash

MPATH="/home/bjohnson/projects/darknet-bkj/custom-tools/pfr-data/backup"

IMG_DIR=f
IMG_PATH="/home/bjohnson/projects/sm-analytics/etl/kafka/data/imgs/s3.amazonaws.com/pipeline-image-store/images/default/default/$IMG_DIR"
find $IMG_PATH -type f > test.txt

for weights in $(ls $MPATH | shuf); do
    f=$(echo $weights | cut -d'.' -f1)
    cat test.txt | ./detect-thread.py --weight-path $MPATH/$weights  > ./results/results-$f
done