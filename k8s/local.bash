#!/bin/bash

echo ".....Starting....."

# remove apps docker images if exists
echo ".....Cleaning docker images....."

docker-compose rm -s -f auth-service
docker rmi auth-service

# build all jars
echo ".....Building all jars....."

cd ../auth-service
./gradlew clean build -x test

cd -

echo ".....Building images....."

docker-compose up -d

echo ".....Success....."