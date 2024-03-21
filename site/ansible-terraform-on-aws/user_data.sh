#! /bin/bash
sudo hostnamectl  set-hostname linux-controller
sudo -i
sudo yum update -y
sudo yum install python3-pip
sudo install-ansible-amazon linux2-epel.sh
sudo amazon-linux-extras install ansible2 -y.

