#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

source ./functions.sh
source ./set-env.sh

#kubectl apply \
#  -n kafka \
#  -f https://github.com/strimzi/strimzi-kafka-operator/releases/download/${STRIMZI_VERSION}/strimzi-cluster-operator-${STRIMZI_VERSION}.yaml

#kubectl apply -f https://strimzi.io/examples/${STRIMZI_VERSION}/kafka/kafka-persistent-single.yaml -n kafka

#kubectl apply -f https://raw.githubusercontent.com/strimzi/strimzi-kafka-operator/main/examples/kafka/kafka-ephemeral-single.yaml

#kubectl apply \
#  -n kafka \
#  -f https://raw.githubusercontent.com/strimzi/strimzi-kafka-operator/${STRIMZI_VERSION}/examples/kafka/kafka-ephemeral-single.yaml


# echo "waiting for the cluster to get ready"
# kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka


#ubectl create -f 'https://strimzi.io/install/${STRIMZI_VERSION}?namespace=kafka' -n kafka

#kubectl create -f https://github.com/strimzi/strimzi-kafka-operator/releases/download/0.33.2/strimzi-cluster-operator-0.33.2.yaml

#kubectl apply -f https://strimzi.io/examples/${STRIMZI_VERSION}/kafka/kafka-persistent-single.yaml -n kafka 

#kubectl get pods -n kafka -w


kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kafka 
kubectl get pods -n kafka -w
