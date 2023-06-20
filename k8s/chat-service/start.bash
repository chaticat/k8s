#!/bin/bash

cd ../../../chat-service
./gradlew clean build -x test

kubectl delete deployment chat-service
docker rmi --force chat-service
docker build -t chat-service .

cd -
cd ../

kubectl apply -f chat-service
