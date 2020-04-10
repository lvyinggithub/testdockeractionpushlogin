#!/bin/sh -l
##!/bin/bash
#echo "Hello $1"
#time=$(date)
echo "::set-output name=time::$time"

docker build . --file Dockerfile --tag my-image-name:3

docker login -u $1 -p $2

docker tag my-image-name:3 lvyingde51/test:3

docker push lvyingde51/test:3
