#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

source ./functions.sh
source ./set-env.sh

./20-get-tools.sh
./30-start-a-k8s-cluster.sh
./40-start-kafka-cluster.sh
