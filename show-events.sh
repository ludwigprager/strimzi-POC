#!/bin/bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

source ./set-env.sh

set -eu

while true; do
  clear

  for cluster in $CLUSTERS; do

    echo $cluster:

    kubectl get --context=k3d-${cluster} events \
            --sort-by='.metadata.creationTimestamp' -A \
            | tail -n 5
#   kubectl --context=k3d-${cluster} get events
#           --sort-by='.metadata.creationTimestamp' -A >> events.txt
    echo

  done

# echo



  sleep 10
done

