# centos 7


Start service
```
systemctl <action> service_name
```
Available <action> is
```
status
start
stop
reload
disable
enable
is-active
is-enable
is-failed
cat
edit
list-dependencies
show
mask
unmask
```




To see a list of all of the active units that systemd knows about, we can use the list-units command:
```
systemctl list-units
systemctl list-units --all
systemctl list-units --all --state=inactive

```

## Check if service is enable
```
systemctl list-unit-files
sudo systemctl daemon-reload
```