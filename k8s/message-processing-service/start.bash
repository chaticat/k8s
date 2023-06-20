#!/bin/bash

cd ../../../message-processing-service
./gradlew clean build -x test

kubectl delete deployment message-processing-service
docker rmi --force message-processing-service
docker build -t message-processing-service .

cd -
cd ../

kubectl apply -f message-processing-service
