# First install


sudo yum install epel-release -y
sudo yum install vim xz tmux ntp git gitflow zip unzip wget curl telnet -y



# Time zone
sudo timedatectl set-timezone Asia/Ho_Chi_Minh

#sudo mv /etc/localtime /etc/localtime.bak
#sudo ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
#
#sudo mv /etc/sysconfig/clock /etc/sysconfig/clock.bak
#sudo sh -c "echo 'ZONE=\"Asia/Ho_Chi_Minh\"' > /etc/sysconfig/clock"

sudo systemctl restart crond
sudo systemctl enable crond

sudo systemctl start ntpd
sudo systemctl enable ntpd


### SSH
#### ssh slow
sudo sed -i 's/^GSSAPIAuthentication yes$/GSSAPIAuthentication no/' /etc/ssh/sshd_config

# make root group sudo
sudo sed -i '/^## Same thing without a password/a \%root        ALL=(ALL)       NOPASSWD: ALL' /etc/sudoers
#### ssh password
sudo sed -i 's/^PasswordAuthentication yes$/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd


# ranger browser file
git clone https://github.com/hut/ranger.git
cd ranger && sudo ./setup.py install
cd

# firewall
sudo systemctl enable firewalld
sudo systemctl start firewalld

# check mk
sudo yum install check-mk-agent xinetd -y
sudo systemctl start xinetd
sudo systemctl enable xinetd
firewall-cmd --add-port=6556/tcp --permanent
firewall-cmd --reload


# json parse
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
chmod +x jq-linux64
sudo mv jq-linux64 /usr/bin/jq


# speed test cli
sudo yum install python-pip -y
sudo pip install speedtest-cli
sudo pip install speedtest-cli --upgrade
#speedtest