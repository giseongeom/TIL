# WinNAT Troubleshooting

## 증상

* `Docker for Windows` 설치하고 Windows Container로 switch 시도할 때
* 다음의 에러 메시지와 함께 docker 구동 실패
```
Error starting daemon: 
Error initializing network controller: 
Error creating default network: 
  HNS failed with error : The parameter is incorrect. 
```

## 원인 및 해결 방법

* 기존에 설치/삭제했던 Hyper-V의 NAT Network 구성이 남아 있어서 발생한 것임
* 일단 docker를 종료한다
* 관리자 권한으로 powershell 실행
* `Get-NetNAT` cmdlet 으로 NAT 구성이 있는지 확인
* 표시되는 NetNAT 설정이 있다면 삭제해야 한다.
* 그 전에 WinNAT 서비스가 정상적으로 실행되어 있어야 한다. 정지되어 있으면 실행할 것
```powershell
PS # Get-Service winNAT

Status   Name               DisplayName
------   ----               -----------
Running  winNAT             Windows NAT Driver
```
* NAT 설정을 삭제
```powershell
Get-NetNat | Remove-NetNAat
```
* 다시 docker 실행하고 Windows Container로 Switch 시도한다.
* 정상적으로 진행되는 경우, 다음과 같이 ContainerNetwork가 구성되어 있어야 한다.
```powershell
PS # Get-NetNat

Name                             : Hded6582b-cd53-46b6-8661-e6a8559ee6f3
ExternalIPInterfaceAddressPrefix :
InternalIPInterfaceAddressPrefix : 172.21.80.1/20
IcmpQueryTimeout                 : 30
TcpEstablishedConnectionTimeout  : 1800
TcpTransientConnectionTimeout    : 120
TcpFilteringBehavior             : AddressDependentFiltering
UdpFilteringBehavior             : AddressDependentFiltering
UdpIdleSessionTimeout            : 120
UdpInboundRefresh                : False
Store                            : Local
Active                           : True


PS # Get-ContainerNetwork

Name Id                                   Subnets          Mode SourceMac DNSServers DNSSuffix
---- --                                   -------          ---- --------- ---------- ---------
nat  ded6582b-cd53-46b6-8661-e6a8559ee6f3 {172.21.80.0/20} NAT
```
Name, Subnet 은 환경에 따라 달라질 수 있음.


## 참고자료

* [Unable to start Docker: HNS failed with error : The parameter is incorrect.598](https://github.com/docker/for-win/issues/598)
* [Windows container: Cannot start with error "Error response from daemon: container ... encountered an error during CreateContainer: failure in a Windows system call: The system cannot find the path specified. (0x3)](https://github.com/docker/docker/issues/31469)