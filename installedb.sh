#!/bin/bash

# Install Prerequisites
sudo rpm -Uvh http://yum.enterprisedb.com/edbrepos/edb-repo-latest.noarch.rpm
sudo yum install nano wget mlocate epel-release telnet -y
echo "******************************"
echo "****** Enter userstring ******"
echo "******************************"
read userstring
# Copy and modify repo file

sudo cp /etc/yum.repos.d/edb.repo /etc/yum.repos.d/edb_backup.repo
sudo sed -i "s/<username>:<password>/${userstring}/g" edb.repo
sudo sed -i "\/enterprisedb-dependencies/,/gpgcheck/s/enabled=0/enabled=1/" /etc/yum.repos.d/edb.repo
sudo sed -i "\/enterprisedb-tools/,/gpgcheck/s/enabled=0/enabled=1/" /etc/yum.repos.d/edb.repo
sudo sed -i "\/edbas11/,/gpgcheck/s/enabled=0/enabled=1/" /etc/yum.repos.d/edb.repo
echo "******************************"
echo "******     Patched      ******"
echo "******************************"

# Installation
sudo yum install edb-as11 -y
sudo /usr/edb/as11/bin/edb-as-11-setup initdb
sudo systemctl start edb-as-11
