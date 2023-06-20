#!/bin/bash

cd ../../../auth-service
./gradlew clean build -x test

kubectl delete deployment auth-service
docker rmi --force auth-service
docker build -t auth-service .

cd -
cd ../

kubectl apply -f auth-service
