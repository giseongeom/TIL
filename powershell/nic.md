# NIC 랜카드 관리


## AdapterBinding

### NIC에서 IPv4, IPv6 Binding 해제

* 대상
```
ms_tcpip,ms_tcpip6,ms_msclient,ms_server
TCP/IPv4, TCP/IPv6, Client for Microsoft Networks, File and Printer Sharing for Microsoft Networks
```
* 케이블이 없는 NIC의 IP Binding 해제
```powershell
Get-NetAdapter | ? { $_.status -ne 'up' } | sort Name |  `
  % { Disable-NetAdapterBinding -Name $_.Name -ComponentID ms_tcpip,ms_tcpip6,ms_msclient,ms_server }
```
* 확인
```powershell
Get-NetAdapter | ? { $_.status -ne 'up' } | sort Name |  `
  % { Get-NetAdapterBinding -Name $_.Name }
```

## NIC Enable/Disable

* 사용하지 않는 NIC를 `Disable` 설정
```powershell
Get-NetAdapter | ? { $_.status -ne 'up' } | sort name | `
  % { Disable-NetAdapter -Name $_.Name -Verbose -Confirm:$false }

VERBOSE: Disable-NetAdapter 'Ethernet 2'
VERBOSE: Disable-NetAdapter 'Ethernet 3'
VERBOSE: Disable-NetAdapter 'Ethernet 4'

PS C:\> Get-NetAdapter | ft -AutoSize

Name       InterfaceDescription                     ifIndex Status   MacAddress        LinkSpeed
----       --------------------                     ------- ------   ----------        ---------
Ethernet 3 Intel(R) I350 Gigabit Network Conn...#3        7 Disabled 0C-C4-7A-31-98-D7     0 bps
Ethernet   Intel(R) I350 Gigabit Network Connection       4 Up       0C-C4-7A-31-98-D6    1 Gbps
Ethernet 4 Intel(R) I350 Gigabit Network Conn...#4        2 Disabled 0C-C4-7A-31-98-D5     0 bps
Ethernet 2 Intel(R) I350 Gigabit Network Conn...#2        3 Disabled 0C-C4-7A-31-98-D4     0 bps
```