# ADDS 관련 사용 예제

## Computer Account

* Computer Account 등록
  * WORK-VMupdate 이름으로 Computer Account를 생성

```powershell
New-ADComputer -Name WORK-VMupdate -SAMAccountName WORK-VMupdate -Path "OU=Infra,OU=Server,OU=Computers,OU=my,DC=example,DC=net"
```