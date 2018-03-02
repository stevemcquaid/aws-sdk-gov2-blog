#!/bin/bash
echo 'Installing python...'
apt-get update -y && apt-get install -y python
echo 'Python installed!'

apt-get install -y  apt-transport-https  ca-certificates   curl   software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
      stable"
apt-get update

echo 'Installing docker...'
apt-get install -y docker-ce
usermod -aG docker ubuntu
echo 'Docker installed!'

echo "Running my container on port 80"
docker run -it -d -p 80:80 --rm stevemcquaid/python-flask-docker-hello-world:latest