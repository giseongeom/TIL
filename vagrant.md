# Vagrant 사용 팁

## Guest Network Configuration

### CentOS

* sed 사용
```
[vagrant@chef-node2 ~]$ sudo sh -c 'sed 's/192.168.254.100/192.168.254.102/' /vagrant/network/centos/ifcfg-eth0 > /etc/sysconfig/network-scripts/ifcfg-eth0'
```

### Ubuntu

## synced_folder

### rsync

* Hyper-V provider 환경에서 rsynced folder 설정
* `vagrant up` 실행하면.. 다음의 에러 메시지 표시 (ssh, rsync는 Cygwin64의 그것을 활용. PATH 변수에 추가함)
```
==> default:   - Exclude: [".vagrant/", ".git/"]
There was an error when attempting to rsync a synced folder.
Please inspect the error message below for more info.

Host path: /c/Users/giseong.eom/Documents/sampleVagrant/
Guest path: /vagrant
rsync: change_dir "/c/Users/giseong.eom/Documents/sampleVagrant" failed: No such file or directory (2)
rsync error: some files/attrs were not transferred (see previous errors) (code 23) at /usr/src/ports/rsync/rsync-3.0.9-1/src/rsync-3.0.9/main.c(1052) [sender=3.0.9]
```
* 해결방법
    * cygwin Terminal 실행
    * /etc/fstab을 다음과 같이 수정
```
none / cygdrive binary,posix=0,user 0 0
```

* 다시 vagrant up 실행해보자. 잘 진행되는 것을 볼 수 있음.
```
==> default: Installing rsync to the VM...
==> default: Rsyncing folder: /c/Users/giseong.eom/Documents/sampleVagrant/ => /vagrant
==> default:   - Exclude: [".vagrant/", ".git/"]
```


## Provider

### VMware Workstation 

* Plugin 설치 / 라이센스 적용
```
C:\> vagrant plugin install vagrant-vmware-workstation
C:\> vagrant plugin license vagrant-vmware-workstation c:\temp\license-2015.01.lic
```

* Default provider 설정
환경 변수 *VAGRANT_DEFAULT_PROVIDER* 설정
```
VAGRANT_DEFAULT_PROVIDER=vmware_workstation
```

* Port Forwarding
* 기본값
    * Linux: `22 -> 2222`
    * Windows
```
22 -> 2222
5985 -> 55985
```
* Port Forwarding 해제
* Vagrantfile에서 다음의 내용을 삽입
```
  # config.vm.network "forwarded_port"
  config.vm.network "forwarded_port", id: "ssh", guest: 22, host: 2222, disabled: true
  config.vm.network "forwarded_port", id: "winrm", guest: 5985, host: 55985, disabled: true
```

* config.vm.hostname
    * Windows Guest의 경우 `config.vm.hostname` 이용해서 Hostname 설정 했을 때 문제 발생
    * 즉 ComputerName 변경되고 재부팅을 안한 상태
* 기본적인 기능들이 제대로 동작하지 않을 가능성 높음
* vagrant rdp의 경우 vagrant 사용자로 로그인 불가
* `.\vagrant`로 지정해주면 로그인됨 (Guest 재부팅하면 문제 해결됨)

### HyperV

* Default provider 설정
환경 변수 *VAGRANT_DEFAULT_PROVIDER* 설정
```
VAGRANT_DEFAULT_PROVIDER=hyperv
```

* hyperv Provider 소스 수정 (관리자 권한 체크하는 루틴)
* `c:\HashiCorp\Vagrant\embedded\gems\gems\vagrant-1.5.2\plugins\providers\hyperv\provider.rb` 파일을 수정
* 소스 내용
```ruby
module VagrantPlugins
  module HyperV
    class Provider < Vagrant.plugin("2", :provider)
      attr_reader :driver

      def initialize(machine)
        @machine = machine

        if !Vagrant::Util::Platform.windows?
          raise Errors::WindowsRequired
        end

        #if !Vagrant::Util::Platform.windows_admin?
        #  raise Errors::AdminRequired
        #end 
```

* MSOpenTech의 Hyper-V plugin 설치
```
C:\> vagrant plugin install vagrant-windows-hyperv
```

## Box 사전 작업

### CentOS 6

* 먼저 인터넷 연결 가능하도록 설정
    * `/etc/sysconfig/network-scripts/ifcfg-ethX` 파일 수정 (초 단순 버전)
```
DEVICE=eth0
NM_CONTROLLED=no
ONBOOT=yes
BOOTPROTO=dhcp
```

* gcc, make 설치
```bash
# yum -y install gcc make man perl
```

* 계정관련 작업
    * 설치하면서 root 계정의 암호 설정: **vagrant**
    * vagrant 계정 생성 하고 암호 설정: **vagrant**

```bash
# useradd -m -s /bin/bash vagrant
# echo 'vagrant:vagrant' | chpasswd
```

* CoreOS에서 가져온 update-ssh-keys 스크립트를 /usr/local/sbin 경로에 복사. permission 확인 (755)
    * vagrant 에서 사용하는 공용 키를 authorized_keys에 등록한다. (update-ssh-keys 명령을 이용하면 한 방에 가능)
    * `/home/vagrant/.ssh` 폴더 생성. 퍼미션 700
    * `/home/vagrant/.ssh` 폴더에 authorized_keys 파일 복사. 퍼미션 600
    * cygwin 에서 vagrant box 원본 VM에 접속해서 *insecure_public_key* 등록할 수 있다.
```bash
[cygwin] giseong.eom@GiSeong-PC ~
$ cat ~/.ssh/insecure_public_key | ssh vagrant@192.168.98.106 \
  "/usr/local/sbin/update-ssh-keys -a vagrant"

vagrant@192.168.98.106's password:
Adding/updating vagrant:
2048 dd:3b:b8:2e:85:04:06:e9:ab:ff:a8:0a:c0:04:6e:d6 /home/vagrant/.ssh/authorized_keys.d/vagrant.vAZs8WwGQh (RSA)
Updated /home/vagrant/.ssh/authorized_keys
```

* root 계정의 EDITOR 환경변수 설정 (/root/.bashrc 수정) `visudo` 사용해야 하므로 중요
```
export EDITOR=vi
```
한 방에 수정하기
```bash
echo "" >> ~/.bashrc ; echo "" >> ~/.bashrc ; echo "export EDITOR=vi" >> ~/.bashrc
```

* sudo 설정
vagrant 사용자에게 모든 암호를 묻지 않고 바로 sudo 실행할 수 있도록 설정 
```
vagrant ALL=(ALL)       NOPASSWD: ALL
```
한 방에 수정하기
```
echo 'vagrant ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
```

* `requiretty` 주석 처리한다
```
#
# Disable "ssh hostname sudo <cmd>", because it will show the password in clear.
#         You have to run "ssh -t hostname sudo <cmd>".
#
#Defaults    requiretty
```
한 방에 수정하기
```
sed -i 's/^\(Defaults.*requiretty\)/#\1/' /etc/sudoers
```


* 기타 설정
    * sshd 설정 (/etc/ssh/sshd_config 수정)
```
UseDNS no
```

* 추가 패키지 설치
    * VMware Tools 설치 - VMware Provider 환경에서는 필수
    * hypervkvpd - Hyper-V Provider 환경에서는 필수
CentOS 7 에서는 설치 후 enabled 설정 필요함
```
# systemctl status hypervkvpd
```
    * gcc, make, man, perl - VMware Tools 패키지 설지할 때 필요할 수 있음
    * vim
    * rsync
    * openssh-clients (scp 사용하려면 필수)
    * redhat-lsb
    * chef
```bash
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
    * puppet
```bash
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install puppet
```


* ethX 디바이스 넘버 변경되지 않도록 설정
    * `/etc/udev/rules.d/70-persistent-net.rules` 파일 삭제

* `shutdown !!!`



### CentOS 7

* 설치할 때 인터넷 가능하도록 네트워크 설정

* 설치 필요한 패키지
    * net-tools
    * vim
    * redhat-lsb
    * chef
```bash
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
  * puppet
```
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum install puppet
```

* `shutdown !!!`


### Ubuntu

* 계정관련 작업
    * 설치하면서 vagrant 계정을 생성한다.
    * vagrant 계정의 암호 설정: *vagrant*
    * weak password 라고 경고해도 무시한다.
    * root 계정 enable
    * root 계정의 암호 설정: `vagrant`
    * CoreOS에서 가져온 update-ssh-keys 스크립트를 /usr/local/sbin 경로에 복사. permission 확인 (755)
    * vagrant 에서 사용하는 공용 키를 authorized_keys에 등록한다. (update-ssh-keys 명령을 이용하면 한 방에 가능)
    * root 계정의 EDITOR 환경변수 설정 (/root/.bashrc 수정) `visudo` 사용해야 하므로 중요
```bash
# usermod -U root ; echo 'root:vagrant' | chpasswd
# export EDITOR=vi
```

한 방에 수정하기
```bash
# echo "" >> ~/.bashrc ; echo "" >> ~/.bashrc ; echo "export EDITOR=vi" >> ~/.bashrc
```

sudo 설정 - vagrant 사용자에게 모든 암호를 묻지 않고 바로 sudo 실행할 수 있도록 설정 
```bash
vagrant ALL=(ALL)       NOPASSWD: ALL
```

한 방에 수정
```bash
echo 'vagrant ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
```

* 기타 설정
sshd 설정 `/etc/ssh/sshd_config` 수정
```bash
UseDNS no
```

한 방에 수정
```bash
echo 'UseDNS no' >> /etc/ssh/sshd_config
```

* 추가 패키지 설치 
    * chef
```bash
$ curl -L https://www.opscode.com/chef/install.sh | sudo bash
$ chef-client -v
Chef: 12.0.3
```

    * Ubuntu 14.04.1 (32-bit)에서 chef 설치후 오류. 그래서, puppet만 설치함
    * puppet
```bash
$ wget https://apt.puppetlabs.com/puppetlabs-release-pc1-`lsb_release -c -s`.deb
$ sudo dpkg -i puppetlabs-release-pc1-`lsb_release -c -s`.deb
$ sudo apt-get update
$ sudo apt-get -y install puppet-agent
$ /opt/puppetlabs/bin/puppet -V
```

* ethX 디바이스 넘버 변경되지 않도록 설정
    * `/etc/udev/rules.d/70-persistent-net.rules` 파일 삭제

* `shutdown !!!`


### Microsoft Windows 

* gpedit.msc 이용
    * Turn off UAC (Msconfig) : Server Core 옵션으로 변경하면 자동 반영됨
    * Disable complex passwords
    * Disable Shutdown Event Tracker
* Create a vagrant user, for things to work out of the box username and password should both be "vagrant".
```batch
net user vagrant vagrant /ADD
net localgroup Administrators vagrant /add
```

* Enable and configure WinRM
```powershell
PS C:\Users\Administrator> Enable-PSRemoting -Verbose -Force -SkipNetworkProfileCheck

WinRM is already set up to receive requests on this computer.
WinRM has been updated for remote management.
Configured LocalAccountTokenFilterPolicy to grant administrative rights remotely to local users.
```
* WinRM 기본값 수정 (2012 R2 기준)
```
   winrm set winrm/config @{MaxTimeoutms="1800000"}
   winrm set winrm/config/service @{AllowUnencrypted="true"}
   winrm set winrm/config/service/auth @{Basic="true"}
```
* FQDN이 아닌 이름/IP로 Remote Machine 연결을 허용 (Client side)
```powershell
# 모든 머신으로 Outgoing 접속 허용
Set-Item wsman:localhost\client\trustedhosts -Value * -Force
```

* Windows SmartScreen 설정 활성화(gpedit.msc)
```
- Computer Configuration > Administrative Templates > Windows Components > File Explorer
- Configure Windows SmartScreen - Enabled
```

* IE Enhanced Security Configuration: Off
* Windows Firewall and Advanced Security: 그룹 단위로 허용한다.
    * Remote Desktop: Enabled
    * File and Printer Sharing: Enabled
    * File and Printer Sharing: Windows Remote Management

* chef 설치
    * Chef Client | Chef Downloads | Chef 방문 `https://www.chef.io/download-chef-client/`
    * Windows Server 2012 R2 버전 다운로드: chef-client-12.0.3-1.msi
    * Service 관련 컴포넌트도 설치
    * Service 시작 유형을 `Manual Type` 으로 지정

* puppet 설치
    * Puppet Labs Windows packages Download 방문 - https://downloads.puppetlabs.com/windows/
    * 최신 64-bit 버전 다운로드: puppet-latest.msi
    * Service 시작 유형을 `Manual Type` 으로 지정

* builtin\Administrator 계정의 암호 만료되지 않도록 설정
    * C:\Windows\Setup\Scripts 폴더에 SetupComplete.cmd 파일 생성하고 아래 내용을 저장
```batch
@echo off
REM set builtin-administrator password not expired
c:\Windows\System32\wbem\WMIC.exe USERACCOUNT WHERE "Name='Administrator'" set PasswordExpires=FALSE
```
* vagrant 계정의 경우는 wmic 명령으로 미리 설정해 둔다. (sysprep 과정에서 그대로 유지됨)

#### Server Core

* secedit 명령으로 Security Configuration 덤프
```batch
secedit.exe /export /cfg c:\Windows\temp\sec-config.cfg
```
* PasswordComplexity 값을 1 에서 `0` 으로 수정
```batch
notepad c:\Windows\temp\sec-config.cfg
  "PasswordComplexity = 0"
```
* 수정한 설정을 new.sdb 파일에 반영
```batch
secedit.exe /configure /db c:\Windows\security\new.sdb /cfg c:\Windows\Temp\sec-config.cfg /areas SECURITYPOLICY
```
* 계정의 암호만료설정을 해제하고, vagrant 계정을 생성(동시에 Administraotrs 그룹에 추가), Administrator 계정의 암호를 `vagrant` 로 변경함
```batch
net accounts /MAXPWAGE:UNLIMITED
net user vagrant vagrant /ADD
net localgroup Administrators vagrant /add
net user administrator vagrant
```
* PowerShell Remoting 관련 환경설정
```powershell
powershell -ExecutionPolicy Bypass -command "& {Enable-PSRemoting -SkipNetworkProfileCheck -Force}"
powershell -ExecutionPolicy Bypass -command "& {Set-Item wsman:localhost\client\trustedhosts -Value * -Force}"

winrm set winrm/config/service @{AllowUnencrypted="true"}
winrm set winrm/config/service/auth @{Basic="true"}
winrm set winrm/config/client @{AllowUnencrypted="true"}
winrm set winrm/config/client/auth @{Basic="true"}
```
* Telnet-Client 설치
```
dism /online /enable-feature:TelnetClient
```
* chocolatey 설치
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```
* Remote Desktop
    * sconfig 실행
    * Enable RemoteDesktop
    * Disable NLA (Network Level Authentication - all clients) 선택
    * RemoteDesktop 관련 방화벽 추가 설정
```
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes
```
* Chef/Puppet 다운로드
```powershell
start powershell -ExecutionPolicy Bypass -command "& {Invoke-WebRequest -Uri https://downloads.puppetlabs.com/windows/puppet-agent-1.2.1-x64.msi -OutFile C:\Windows\Temp\puppet.msi}"
start powershell -ExecutionPolicy Bypass -command "& {Invoke-WebRequest -Uri https://opscode-omnibus-packages.s3.amazonaws.com/windows/2008r2/x86_64/chef-client-12.4.0-1.msi -OutFile C:\Windows\Temp\chef.msi}

powershell -ExecutionPolicy Bypass -command "& {Set-Service puppet -StartupType Manual}
powershell -ExecutionPolicy Bypass -command "& {Set-Service chef-client -StartupType Manual}

del /q /f c:\windows\temp\*.msi
del /q /f c:\Windows\Temp\sec-config.cfg
```
    * Interactive 설치
    * C:\Windows\Temp\puppet.msi
    * C:\Windows\Temp\chef.msi
    * 서비스 시작유형 변경
    * 파일 삭제

* 전체작업과정을 정리: [WS2012R2-ServerCore-CreateBox.txt](https://github.com/giseongeom/TIL/blob/master/vagrant/WS2012R2-ServerCore-CreateBox.txt) 참고




## 참고자료

* [CREATING A BASE BOX](http://docs.vagrantup.com/v2/boxes/base.html)
* [VMware - CREATING A BASE BOX](https://docs.vagrantup.com/v2/vmware/boxes.html)
* [Hyper-V - CREATING A BASE BOX](http://docs.vagrantup.com/v2/hyperv/boxes.html)
* [Vagrant Windows Hyper-V Provider](https://github.com/MSOpenTech/vagrant-windows-hyperv)
* [Vagrant Windows Hyper-V Provider (deprecated)](https://github.com/WinRb/vagrant-windows)
* [How to disable the Shutdown Event Tracker in Server 2003/2008](http://www.jppinto.com/2010/01/how-to-disable-the-shutdown-event-tracker-in-server-20032008/)
* [Docs » Installing Puppet: Debian and Ubuntu](https://docs.puppetlabs.com/guides/install_puppet/install_debian_ubuntu.html#supported-versions)
* [Docs » Installing Puppet: Red Hat Enterprise Linux (and Derivatives)](https://docs.puppetlabs.com/guides/install_puppet/install_el.html)
* [give a chance to disable default ssh port forwarding (mitchellh/vagrant)](https://github.com/mitchellh/vagrant/issues/1922)
* [base_mac is totally undocumented](https://github.com/mitchellh/vagrant/issues/3609)
* [Issue with base_mac](https://groups.google.com/forum/#!topic/vagrant-up/-2OSsEITs_w)
* [Shell Scripts - Provisioning - Vagrant Documentation](https://docs.vagrantup.com/v2/provisioning/shell.html)
* [Enable Remote Desktop for Windows Server 2012 R2 Core](http://www.packet6.com/unable-to-remote-desktop-into-windows-server-2012-r2-core/)
* [How to disable Password complexity on Server Core installations](http://servercore.net/index.php/2014/01/how-to-disable-password-complexity-on-server-core-installations)
* [Windows 7: Password Expiration - Change MAX and MIN Password Age](http://www.sevenforums.com/tutorials/73224-password-expiration-change-max-min-password-age.html)
* [SecEdit](https://technet.microsoft.com/en-us/library/bb490997.aspx?f=255&MSPPError=-2147217396)
