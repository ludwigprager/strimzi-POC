#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

source ./functions.sh
source ./set-env.sh



if ! cluster-exists $CLUSTER; then
  ./k3d cluster create $CLUSTER \
    --wait 

#     --config k3d-config/$cluster.yaml \

fi

# create endpoint in cluster pointing to my primary IP address
kubectl apply -f manifest/namespace.yaml

#  export PRIMARY_IP=$(get-primary-ip)
#  envsubst < manifest/external-service.yaml.tpl | kubectl apply -nkafka -f -



#echo "waiting for metrics server pod to get ready"
#kubectl wait --for=condition=ready --timeout=90s -nkube-system pod -l k8s-app=metrics-server
