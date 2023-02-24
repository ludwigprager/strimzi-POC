#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

source ./functions.sh
source ./set-env.sh


kubectl -n kafka run kafka-producer -ti \
  --image=quay.io/strimzi/kafka:0.23.0-kafka-2.8.0 \
  --rm=true \
  --restart=Never \
  -- bin/kafka-console-producer.sh \
  --broker-list my-cluster-kafka-bootstrap:9092 \
  --topic my-topic
