#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

source ./functions.sh
source ./set-env.sh




kubectl -n kafka run kafka-producer -ti \
  --image=quay.io/strimzi/kafka:${STRIMZI_VERSION}-kafka-3.4.0 \
  --rm=true \
  --restart=Never \
  -- bin/kafka-console-producer.sh \
  --bootstrap-server my-cluster-kafka-bootstrap:9092 \
  --topic my-topic

kubectl -n kafka run kafka-consumer -ti \
  --image=quay.io/strimzi/kafka:${STRIMZI_VERSION}-kafka-3.4.0 \
  --rm=true \
  --restart=Never \
  -- \
    bin/kafka-console-consumer.sh \
    --bootstrap-server my-cluster-kafka-bootstrap:9092 \
    --topic my-topic \
    --from-beginning
