#!/usr/bin/env bash

#alias kubectl="${BASEDIR:-$(pwd)}/kubectl"

export PATH=${BASEDIR:-$(pwd)}:${PATH}
export KUBECONFIG=${BASEDIR:-$(pwd)}/kubeconfig


export CLUSTER="strimzi-POC"

STRIMZI_VERSION=0.33.2

K3D_VERSION=5.4.7
