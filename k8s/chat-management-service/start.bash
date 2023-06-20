#!/bin/bash

cd ../../../chat-management-service
./gradlew clean build -x test

kubectl delete deployment chat-management-service
docker rmi --force chat-management-service
docker build -t chat-management-service .

cd -
cd ../

kubectl apply -f chat-management-service
