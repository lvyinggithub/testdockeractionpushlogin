#!/bin/bash
docker build . --file Dockerfile --tag my-image-name:3

docker login -u ${{ secrets.DOCKER_USERNAME }} -p ${{ secrets.DOCKER_PASSWORD }}

docker tag my-image-name:3 lvyingde51/test:3

docker push lvyingde51/test:3