#!/bin/sh -l
##!/bin/bash
#echo "Hello $1"
#time=$(date)
echo "::set-output name=time::$time"

docker build . --file Dockerfile --tag lvyingde51/test:3
echo "user"+$1
echo "pwd"+$2
docker login -u $1 -p $2

docker tag lvyingde51/test:3 lvyingde51/test:3

docker push lvyingde51/test:3
