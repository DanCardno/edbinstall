sudo setenforce 0
sudo yum install edb-pem-server -y
sudo /usr/edb/pem/bin/configure-pem-server.sh -t 1 -su enterprisedb -sp Galaxy3D4d -p 5444 -ho 127.0.0.1 -ci 0.0.0.0/0 -ds edb-as-11  -acp ~/.pem/ -dbi /usr/edb/as11
