#!/bin/bash
echo "nameserver 192.168.122.1" | tee /etc/resolv.conf > /dev/null
apt-get update
apt-get install nano -y
apt-get install bind9 -y

cp ~/backup/named.conf.local /etc/bind/named.conf.local
cp ~/backup/named.conf.options /etc/bind/named.conf.options
cp -r ~/backup/kaizoku /etc/bind/

service bind9 restart
