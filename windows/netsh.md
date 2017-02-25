# netsh Usage

## Firewall

* Update Core Networking 
```
netsh advfirewall firewall set rule name="Core Networking - IPHTTPS (TCP-In)" new remoteip=localsubnet 
```

* rule 추가
```
netsh advfirewall firewall add rule name="Sample" dir=in profile=any protocol=any remoteip="1.0/16,1.1-1.2" action=allow
```
