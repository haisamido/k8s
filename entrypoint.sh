#! /bin/bash -x

set -e

# /tools/download.sh

# # https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/
# kubeadm init phase control-plane all 

# kubectl config set-context dev-shared
# kubectl config use-context dev-shared

# kubectl config get-clusters

# #kubectl create cluster dev-shared
# kubectl config view 
#kubectl config set-context --current --namespace=<namespace-name>

# kubeadm init phase etcd local
# kubeadm init --skip-phases=control-plane,etcd
# kubeadm token generate
# kubeadm certs certificate-key

#kubeadm init phase etcd local --config=configfile.yaml

#kubectl config set-context --current --namespace=<namespace-name>


tail -f /dev/null 
