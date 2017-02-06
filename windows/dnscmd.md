# dnscmd 

## example

* 레코드 추가
```
[devdc-01]: PS C:\> dnscmd localhost /RecordAdd dev.net dev-vpngw-nx A 192.168.98.94

dev.net에서 dev-vpngw-nx.dev.net에 대해 A 레코드를 추가합니다.
명령이 완료되었습니다.

[devdc-01]: PS C:\Users\exadmin\Documents> nslookup dev-vpngw-nx
서버:    localhost
Address:  127.0.0.1

이름:    dev-vpngw-nx.dev.net
Address:  192.168.98.94
```