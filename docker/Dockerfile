FROM    ubuntu:22.04

#RUN dnf update
RUN apt update
RUN apt install -y curl sudo

RUN for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

RUN sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt update

#RUN apt install -y docker-ce

RUN     apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

RUN apt install -y fuse fuse-overlaysfs

# /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

# sudo apt-get update
# sudo apt-get install ca-certificates curl
# sudo install -m 0755 -d /etc/apt/keyrings
# sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
# sudo chmod a+r /etc/apt/keyrings/docker.asc

# # Add the repository to Apt sources:
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#   $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update

#docker

#RUN dnf install -y jq

COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

# FROM    ubuntu:22.04

# # https://stackoverflow.com/questions/53759814/docker-image-with-minikube-inside

# # installing docker
# RUN     apt-get -y update
# RUN     apt-get -y install \
#         ca-certificates \
#         curl \
#         gnupg \
#         lsb-release

# RUN     mkdir -p /etc/apt/keyrings
# RUN     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# RUN     echo \
#         "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#         $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# RUN     apt-get -y update
# RUN     apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# # installing kubectl
# #RUN     apt-get install -y ca-certificates curl
# RUN     curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
# RUN     echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list

# RUN     apt-get update
# RUN     apt-get install -y kubectl


# # installing other dependencies
# RUN     apt-get install conntrack

# # installing minikube
# RUN     curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
#         && chmod +x minikube

# RUN     mkdir -p /usr/local/bin/
# RUN     install minikube /usr/local/bin/

# CMD     tail -F /dev/null
