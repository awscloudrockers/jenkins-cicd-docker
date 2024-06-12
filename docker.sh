#!/bin/bash
sudo yum update -y
echo "installing git in linux server"
sudo yum install -y git
echo "installing docker service in linux server"
sudo yum install -y docker
echo "docker was installed and need to restart the service to pick up docker commands"
sudo systemctl restart docker
echo "docker service should auto start during boot up time while server restarted"
sudo systemctl enable docker
echo "installing docker compose commands for multi-container orchestration"
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "verify the docker and compose version whether installed or not"
docker --version
docker-compose version
hostname Jenkins-CICD-pipeline
bash
