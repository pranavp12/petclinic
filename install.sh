#!/bin/bash
sudo yum install java-1.8.0-openjdk -y
sudo yum install java-1.8.0-openjdk-devel.x86_64 -y
#sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
#sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
#sudo yum install -y jenkins
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
nohup java -jar jenkins.war --httpPort=9090 &

sudo yum install python3 -y
sudo yum -y install python3-pip
pip3 install ansible --user
ansible --version
sudo yum install git -y
