# Windows Firewall

* Supported
  * Windows PowerShell 3.0 or later
  * Windows 8 / Windows Server 2012 or later

## Firewall rule 확인

* 현재 Enabled rule 확인
```powershell
Get-NetFirewallRule -Enabled True | sort | ft DisplayGroup -AutoSize
```

## Firewall rule 추가 

```
New-NetFirewallRule -DisplayName RemoteAdmin -Direction Inbound `
  -Protocol Any `
  -RemoteAddress 192.168.0.0/16, 10.0.0.1-10.0.0.3, 10.0.0.4 `
  -Action Allow `
  -Enabled True `
```

## Firewall rule 사용안함 (Disabled) 설정

* Remote Desktop 그룹의 모든 rule 사용안함 설정
```powershell
Get-NetFirewallRule -DisplayGroup "Remote Desktop" | Disable-NetFirewallRule -Verbose

VERBOSE: Disable-NetFirewallRule DisplayName: RemoteDesktop-UserMode-In-TCP
VERBOSE: Disable-NetFirewallRule DisplayName: {34B0078A-574B-46CB-948A-070B9B417E4A}
VERBOSE: Disable-NetFirewallRule DisplayName: RemoteDesktop-Shadow-In-TCP
VERBOSE: Disable-NetFirewallRule DisplayName: RemoteDesktop-UserMode-In-UDP
VERBOSE: Disable-NetFirewallRule DisplayName: {29DCCB16-DA35-41A3-8F7C-942F7BFC716B}
VERBOSE: Disable-NetFirewallRule DisplayName: {5E0A8379-BE33-4FDE-A6B4-7BEF756487CE}
```

* Windows Remote Management 그룹의 모든 rule 사용안함 설정
```powershell
Get-NetFirewallRule -DisplayGroup "Windows Remote Management" | Disable-NetFirewallRule -Verbose

VERBOSE: Disable-NetFirewallRule DisplayName: WINRM-HTTP-In-TCP
VERBOSE: Disable-NetFirewallRule DisplayName: WINRM-HTTP-In-TCP-PUBLIC
```
