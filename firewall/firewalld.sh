#file walld
# HoangHH
# Mar 7, 2017

# firewall 
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo systemctl status firewalld


firewall-cmd --reload

firewall-cmd --state

firewall-cmd --get-zones
firewall-cmd --list-all-zones
firewall-cmd --get-default-zone
firewall-cmd --get-active-zones

firewall-cmd --zone=public --list-all



firewall-cmd --set-default-zone=public
# get all supported server
firewall-cmd --get-services

# list all accept services
firewall-cmd --list-services
firewall-cmd --list-ports

firewall-cmd --add-service=http
firewall-cmd --add-service=http --permanent

firewall-cmd  --remove-service=http
firewall-cmd --permanent --add-port=6556/tcp 
firewall-cmd --permanent --add-port=22/tcp 

firewall-cmd --permanent --add-port=5000/tcp 
firewall-cmd --permanent --add-port=8000/tcp 

firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --permanent --add-port=443/tcp 

firewall-cmd --permanent --add-port=3306/tcp
firewall-cmd --add-port=9200/tcp --add-source=192.168.0.0/24
firewall-cmd --add-port=80/tcp --permanent

firewall-cmd --zone=public --remove-service=http --permanent



firewall-cmd --permanent --zone=public --add-source=192.168.100.0/24

# forwarding internal port
firewall-cmd --permanent --add-forward-port=port=443:proto=tcp:toport=8443
firewall-cmd --permanent --add-forward-port=port=80:proto=tcp:toport=8443
firewall-cmd --permanent --add-forward-port=port=80:proto=tcp:toport=8080

# Remove forward port
firewall-cmd --permanent --remove-forward-port=port=443:proto=tcp:toport=8443
firewall-cmd --permanent --remove-forward-port=port=80:proto=tcp:toport=8080
firewall-cmd --permanent --remove-forward-port=port=80:proto=tcp:toport=8443


# Rich rule
firewall-cmd --permanent --zone=trusted --add-rich-rule='rule family="ipv4" source address="public.datasection.com.vn" service name="redis" accept'
firewall-cmd --permanent --zone=trusted --add-rich-rule='rule family="ipv4" source address="117.4.255.125" port port="6379"  protocol="tcp" accept'


firewall-cmd --reload