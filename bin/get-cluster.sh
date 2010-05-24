#!/bin/bash


CLUSTER_URL=$1
CLUSTER_NAME=$2

curl -s $CLUSTER_URL \
    | sed -e "s:<cluster_name>bewest_places.*</cluster_name>:<cluster_name>$CLUSTER_NAME</cluster_name>:g" \
    | tee $CLUSTER_NAME.xml


echo paws start-cluster --cluster-file $CLUSTER_NAME.xml

#####
# EOF
