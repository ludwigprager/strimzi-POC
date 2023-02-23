#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

source ./functions.sh
source ./set-env.sh


./40-start-a-k8s-cluster.sh


kubectl apply -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka

kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kafka 
