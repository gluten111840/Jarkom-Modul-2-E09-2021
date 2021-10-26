#!/bin/bash
echo "nameserver 192.168.122.1" | tee /etc/resolv.conf > /dev/null
apt-get update
apt-get install nano -y
apt-get install dnsutils -y
apt-get install lynx -y

echo "#nameserver 192.168.122.1
nameserver 192.204.2.2
nameserver 192.204.2.3
nameserver 192.204.2.4" > /etc/resolv.conf
