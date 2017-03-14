## SMB3

### SMB3 Multichannel 설정

* Giseong-PC 에서 SMB3 Multichannel Constraint 설정해서 항상 Gigabit NIC 사용하도록 유도.
```powershell
PS> New-SmbMultichannelConstraint -InterfaceAlias Ethernet -ServerName giseong-test02
InterfaceAlias : Ethernet
InterfaceGuid  : {3e7a9c41-6d33-475a-91de-79f2c2b03d3e}
InterfaceIndex : 3
ServerName     : giseong-test02
PSComputerName :

PS> New-SmbMultichannelConstraint -InterfaceAlias Ethernet -ServerName giseong-test02
InterfaceAlias : Ethernet
InterfaceGuid  : {3e7a9c41-6d33-475a-91de-79f2c2b03d3e}
InterfaceIndex : 3
ServerName     : giseong-test02
PSComputerName :


PS> Get-SmbMultichannelConstraint
InterfaceAlias : Ethernet 0
InterfaceGuid  : {409fd8d9-57cf-41e9-9de0-36ccfbe481e0}
InterfaceIndex : 3
ServerName     : giseong-test01
PSComputerName :
InterfaceAlias : Ethernet 0
InterfaceGuid  : {409fd8d9-57cf-41e9-9de0-36ccfbe481e0}
InterfaceIndex : 3
ServerName     : giseong-test02
PSComputerName :
```


* 예제
```powershell
New-SmbMultichannelConstraint -InterfaceAlias RDMA01, RDMA02 -ServerName SMB01
```


## 참고자료

* [HYPER-V OVER SMB: SMB MULTICHANNEL](http://www.thomasmaurer.ch/2013/08/hyper-v-over-smb-smb-multichannel/)
