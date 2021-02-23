#!/bin/bash

# copyright henlo

# setup first 
sudo apt-get install wget tar
wget https://github.com/containerd/containerd/releases/download/v1.3.9/containerd-1.3.9-linux-amd64.tar.gz
tar -zxvf containerd-1.3.9-linux-amd64.tar.gz 
cd bin
sudo install * /usr/bin/
cd ..
rm -rf bin *.tar.gz

sudo apt-get install docker-io runc -y

# build now
docker run --privileged -i -v /proc:/proc \
-v ${PWD}:/working_dir \
-w /working_dir \
debian:latest \
/bin/bash -s etc/terraform-daily-6.0-azure.conf < build.sh

OP=$(realpath builds/*/*.iso)
# bye
echo "Build done !"
echo "Final iso located on $OP"
