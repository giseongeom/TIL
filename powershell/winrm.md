# WinRM Configuration

## LocalAccountTokenFilterPolicy

* 관리자 그룹에 속한 로컬 그룹의 계정으로 Remote Session 연결을 허용 (차단이 기본값임)
```powershell
# View LocalAccountTokenFilterPolicy configuration
get-ItemProperty -Name LocalAccountTokenFilterPolicy -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System

# Enable LocalAccountTokenFilterPolicy (Default)
Set-ItemProperty -Name LocalAccountTokenFilterPolicy -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Value 0

# Disable LocalAccountTokenFilterPolicy 
New-ItemProperty -Name LocalAccountTokenFilterPolicy -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -PropertyType DWord -Value 1
# 
Set-ItemProperty -Name LocalAccountTokenFilterPolicy -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Value 1
```

## TrustedHosts

* FQDN이 아닌 Hostname/IP로 Remote Machine 연결을 허용 (Client side)
```powershell
# TrustedHosts 설정 확인 (기본값은 none)
Get-Item wsman:\localhost\Client\TrustedHosts

# 모든 머신으로 Outgoing 접속 허용
Set-Item wsman:localhost\client\trustedhosts -Value * -Force
```

## CredSSP 설정

### Workstation

* 관리자 권한으로 실행. Role은 Client
```powershell
Enable-WSManCredSSP -Role Client -DelegateComputer * -Verbose
```

### Server

* 관리자 권한으로 실행. Role은 Server
```powershell
Enable-WSManCredSSP -Role Server -Verbose
```