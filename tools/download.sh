#!/bin/bash

#set -e

# https://kubernetes.io/releases/download/

# script to download k8s binaries

# binaries will be placed in
#  ${HOME}/Downloads/${SOURCE}/release/${version}/bin/${os}/${arch}
#    e.g.: ${HOME}/Downloads/dl.k8s.io/release/v1.32.1/bin/linux/amd64/

SOURCE=dl.k8s.io
os=linux
arch=amd64

bins=(
  apiextensions-apiserver 
  kube-aggregator
  kube-apiserver
  kube-controller-manager
  kube-log-runner
  kube-proxy
  kube-scheduler
  kubeadm
  kubectl
  kubectl-convert
  kubelet
  mounter
)

if [ ${os} == "darwin" ]; then
  bins=(
    kubectl
    kubectl-convert
  )
fi

version=$(curl -L -s https://dl.k8s.io/release/stable.txt)

SOURCE_PATH=${SOURCE}/release/${version}/bin/${os}/${arch}
DESTINATION=/downloads/${SOURCE_PATH}

mkdir -p ${DESTINATION}

function downloads () {
  cd ${DESTINATION}
  for bin in "${bins[@]}"; do
    curl -LO "https://${SOURCE_PATH}/${bin}" && chmod +x ./${bin}
  done
}

function installs () {
  cd ${DESTINATION}
  for bin in "${bins[@]}"; do
    install -o root -g root -m 0755 ${bin} /usr/local/bin/${bin}
  done
}

downloads
installs

