## CentOs 6

1. Check listening port

```shell
sudo netstat -lntp
```

2. Check current firewall

```
sudo iptables -L -n
```
OR
```
sudo /etc/init.d/iptables status
```
