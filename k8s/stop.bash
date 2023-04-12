#!/bin/bash

echo ".....Stopping all pods....."

kubectl delete statefulset elastic-search
kubectl delete deployemnt elastic-search-service
kubectl delete deployment zookeeper
kubectl delete deployment kafka
kubectl delete deployment auth-service
kubectl delete deployment message-processing-service
kubectl delete deployment chat-service
kubectl delete deployment chat-management-service

echo ".....Finished....."
