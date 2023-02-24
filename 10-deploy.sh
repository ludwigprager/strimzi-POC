#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

source ./functions.sh
source ./set-env.sh

./20-get-tools.sh

./40-start-a-k8s-cluster.sh

kubectl apply \
  -n kafka \
  -f https://github.com/strimzi/strimzi-kafka-operator/releases/download/${STRIMZI_VERSION}/strimzi-cluster-operator-${STRIMZI_VERSION}.yaml

#kubectl apply -f https://strimzi.io/examples/${STRIMZI_VERSION}/kafka/kafka-persistent-single.yaml -n kafka

#kubectl apply -f https://raw.githubusercontent.com/strimzi/strimzi-kafka-operator/main/examples/kafka/kafka-ephemeral-single.yaml

kubectl apply \
  -n kafka \
  -f https://raw.githubusercontent.com/strimzi/strimzi-kafka-operator/${STRIMZI_VERSION}/examples/kafka/kafka-ephemeral-single.yaml


# echo "waiting for the cluster to get ready"
# kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka
