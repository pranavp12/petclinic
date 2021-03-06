#!/bin/bash
sudo yum install java-1.8.0-openjdk -y
sudo yum install java-1.8.0-openjdk-devel.x86_64 -y
#sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
#sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
#sudo yum install -y jenkins
#sudo chkconfig jenkins on
#sudo chown -R jenkins:jenkins /var/lib/jenkins
#sudo chown -R jenkins:jenkins /var/cache/jenkins
#sudo chown -R jenkins:jenkins /var/log/jenkins
#sudo service jenkins start
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
chown -R jenkins:jenkins /var/lib/jenkins
chown -R jenkins:jenkins /var/cache/jenkins
chown -R jenkins:jenkins /var/log/jenkins
systemctl restart jenkins 
nohup java -jar jenkins.war --httpPort=9090 &

sudo yum install python3 -y
sudo yum -y install python3-pip
pip3 install ansible --user
ansible --version
sudo amazon-linux-extras install ansible2 -y
sudo yum install git -y
