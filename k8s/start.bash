#!/bin/bash

echo ".....Starting....."

echo ".....Setting up postgres....."
kubectl apply -f postgres

echo ".....Setting up kafka....."
kubectl apply -f kafka

echo ".....Setting up auth-service....."

cd ../../auth-service
./gradlew clean build -x test

kubectl delete deployment auth-service
docker rmi --force auth-service
docker build -t auth-service .

cd -

kubectl apply -f auth-service

echo ".....Setting up message-processing-service....."

cd ../../message-processing-service
./gradlew clean build -x test

kubectl delete deployment message-processing-service
docker rmi --force message-processing-service
docker build -t message-processing-service .

cd -

kubectl apply -f message-processing-service

echo ".....Setting up chat-service....."

cd ../../chat-service
./gradlew clean build -x test

kubectl delete deployment chat-service
docker rmi --force chat-service
docker build -t chat-service .

cd -

kubectl apply -f chat-service

echo ".....Setting up chat-management-service....."

cd ../../chat-management-service
./gradlew clean build -x test

kubectl delete deployment chat-management-service
docker rmi --force chat-management-service
docker build -t chat-management-service .

cd -

kubectl apply -f chat-management-service

echo ".....Setting up elastic-search....."
kubectl apply -f elastic-search

echo ".....Setting up elastic-search-service....."

cd ../../elastic-search-service
./gradlew clean build -x test

kubectl delete deployment elastic-search-service
docker rmi --force elastic-search-service
docker build -t elastic-search-service .

cd -

kubectl apply -f elastic-search-service

echo ".....Finished....."
