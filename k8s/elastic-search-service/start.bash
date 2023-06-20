#!/bin/bash

cd ../../../elastic-search-service
./gradlew clean build -x test

kubectl delete deployment elastic-search-service
docker rmi --force elastic-search-service
docker build -t elastic-search-service .

cd -
cd ../

kubectl apply -f elastic-search-service
