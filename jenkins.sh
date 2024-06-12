#!/bin/bash
git -v
docker -v
wget https://get.jenkins.io/war-stable/2.440.2/jenkins.war
yum update -y
yum install -y java
nohup java  -jar jenkins.war &
curl ifconfig.me
cat /root/.jenkins/secrets/initialAdminPassword
