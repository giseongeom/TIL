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
