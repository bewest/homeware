#!/bin/bash

# get-cluster.sh url-to-spec cluster_name
# Writes results to stdout and to cluster_name.xml, as provided in the second
# argument.
# Finally, we print out a command you can use to start the cluster.
# File is saved to current working directory.

CLUSTER_URL=$1
CLUSTER_NAME=$2

curl -s $CLUSTER_URL \
    | sed -e "s:<cluster_name>bewest_places.*</cluster_name>:<cluster_name>$CLUSTER_NAME</cluster_name>:g" \
    | tee $CLUSTER_NAME.xml


# Should go to stderr.
echo paws start-cluster --cluster-file $CLUSTER_NAME.xml

#####
# EOF
