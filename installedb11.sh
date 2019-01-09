#!/bin/bash

# Install Prerequisites
sudo adduser enterprisedb
sudo rpm -Uvh http://yum.enterprisedb.com/edbrepos/edb-repo-latest.noarch.rpm
sudo yum install nano wget mlocate java git epel-release telnet -y
echo "******************************"
echo "****** Enter userstring ******"
echo "******************************"
read userstring
# Copy and modify repo file

sudo cp /etc/yum.repos.d/edb.repo /etc/yum.repos.d/edb_backup.back
sudo sed -i "s/<username>:<password>/${userstring}/g" /etc/yum.repos.d/edb.repo
sudo sed -i "\/enterprisedb-dependencies/,/gpgcheck/s/enabled=0/enabled=1/" /etc/yum.repos.d/edb.repo
sudo sed -i "\/enterprisedb-tools/,/gpgcheck/s/enabled=0/enabled=1/" /etc/yum.repos.d/edb.repo
sudo sed -i "\/edbas11/,/gpgcheck/s/enabled=0/enabled=1/" /etc/yum.repos.d/edb.repo
sudo sed -i "\/enterprisedb-xdb60/,/gpgcheck/s/enabled=0/enabled=1/" /etc/yum.repos.d/edb.repo
echo "******************************"
echo "******     Patched      ******"
echo "******************************"

# Installation
sudo yum install edb-as11 -y
sudo /usr/edb/as11/bin/edb-as-11-setup initdb
sudo systemctl start edb-as-11
sudo systemctl enable edb-as-11

# Set edb password
sudo passwd enterprisedb


