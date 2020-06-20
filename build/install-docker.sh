#!/bin/bash

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

# start docker
systemctl enable docker
systemctl start docker

# add users to docker group (will enable docker command w/o sudo)
# more : https://www.youtube.com/watch?time_continue=56&v=XfZvKLNXC9M&feature=emb_logo
usermod -aG docker ### a non-root user here ###

# update permissions on /var/run/docker.sock (enable docker containers to communicate w/ the host docker engine)
chmod 666 /var/run/docker.sock
