# Nano Server 설정

* Nano Server 설치 후에 꼭 필요한 사전작업을 정리

## AD 도메인 가입

### 도메인 가입된 Windows 10 / Server 2016 기계에서 djoin 실행

* ADDS Domain: `LAB.Local`
* Nano Server의 Hostname: `TEST02`
```powershell
djoin /provision /domain LAB.LOCAL /REUSE /machine TEST02 /savefile C:\TEMP\DJOIN-BLOB-TEST02.txt
```

### BLOB 파일 이용해서 가입

* Nano Server에서 djoin 실행. 그리고, 1회 재부팅
```powershell
djoin /requestodj /loadfile C:\Windows\Temp\DJOIN-BLOB-TEST02.txt /windowspath "C:\windows" /localos
Restart-Computer -Verbose -Force
```

## Network

### DNS Server

* DHCP를 이용하지 않을 때 필요함
```powershell
Set-DnsClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses 192.168.0.10,192.168.0.20
```

### NTP 설정

* AD 가입되어 있어도 Time Source 지정할 필요 있음
```powershell
w32tm /config /update /syncfromflags:ALL /reliable:YES
```

