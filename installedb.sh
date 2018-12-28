#!/bin/bash

sudo rpm -Uvh http://yum.enterprisedb.com/edbrepos/edb-repo-latest.noarch.rpm
sudo yum install nano wget mlocate epel-release telnet -y

echo Enter userstring
read userstring
sudo sed -i "s/<username>:<password>/${userstring}/g" /ect/yum.repos.d/edb.repo
sudo sed -i 's/enabled=0/enabled=1/g' /ect/yum.repos.d/edb.repo
