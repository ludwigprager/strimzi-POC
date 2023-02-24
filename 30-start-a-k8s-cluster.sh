#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

source ./functions.sh
source ./set-env.sh



if ! cluster-exists $CLUSTER; then
  ./k3d cluster create $CLUSTER \
    --wait 
fi
