#!/bin/bash
# new server
# Author: HoangHH
# Date: Mar 1, 2016

# basic
#sudo yum update -y
sudo yum install epel-release -y
sudo yum install vim xz tmux ntp git gitflow zip unzip wget curl telnet -y

# speed test cli
sudo yum install python-pip -y
sudo pip install speedtest-cli
sudo pip install speedtest-cli --upgrade
#speedtest

# Time
sudo mv /etc/localtime /etc/localtime.bak
sudo ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

sudo mv /etc/sysconfig/clock /etc/sysconfig/clock.bak
sudo sh -c "echo 'ZONE=\"Asia/Ho_Chi_Minh\"' > /etc/sysconfig/clock"
sudo /etc/init.d/crond restart

# ntpd
sudo /etc/init.d/ntpd start
sudo chkconfig ntpd on


### SSH
#### ssh slow
sudo sed -i 's/^GSSAPIAuthentication yes$/GSSAPIAuthentication no/' /etc/ssh/sshd_config

# make root group sudo
sudo sed -i '/^## Same thing without a password/a \%root        ALL=(ALL)       NOPASSWD: ALL' /etc/sudoers
#### ssh password
sudo sed -i 's/^PasswordAuthentication yes$/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo /etc/init.d/sshd restart

# ranger browser file
git clone https://github.com/ranger/ranger.git
cd ranger && sudo ./setup.py install
cd

# json parse
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
chmod +x jq-linux64
sudo mv jq-linux64 /usr/bin/jq


# check mk
sudo yum install check-mk-agent xinetd -y
sudo /etc/init.d/xinetd start
sudo chkconfig xinetd on
