# ADDS Setup

## Automated Install

* Unattended ADDS setup - `lab.local` 도메인 구성

```Powershell
#
# Windows PowerShell script for AD DS Deployment
#

Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "lab.local" `
-DomainNetbiosName "LAB" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true
```

## 참고자료

* [Install-ADDSForest / module addsdeployment](https://docs.microsoft.com/en-us/powershell/module/addsdeployment/install-addsforest?view=win10-ps)