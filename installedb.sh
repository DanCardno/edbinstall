#!/bin/bash

sudo rpm -Uvh http://yum.enterprisedb.com/edbrepos/edb-repo-latest.noarch.rpm
sudo yum install nano wget mlocate epel-release telnet -y
echo ******************************
echo ****** Enter userstring ******
echo ******************************
read userstring
sudo sed -i "s/<username>:<password>/${userstring}/g" /etc/yum.repos.d/edb.repo
sudo sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/edb.repo
