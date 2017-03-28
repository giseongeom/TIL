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
