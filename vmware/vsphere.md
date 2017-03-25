## VWware Remote Console

* VMware Remote Console 이용한 1-click 연결
* 단축아이콘 Target 정보
```
"C:\Program Files (x86)\VMware\VMware Remote Console\vmrc.exe" "vmrc://administrator@vsphere.local@WORK-vmadmin.local:443/?moid=vm-1201"
```

## 5.0

### 5.0 Update Management

* vSphere CLI Command Prompt 에서 작업한다.
* 업데이트 파일을 vSphere Host 에 업로드해 두었다고 가정 (winscp 이용)
* `/vmfs/volumes/datastore1/update-from-esxi5.0-5.0_update01.zip`
* vSphere Host를 Maintenance 모드로 변경
```
vicfg-hostops.pl --server 10.0.0.1 --username=root --password=암호 --operation enter
Host 10.0.0.1 entered into maintenance mode successfully.
```

* esxcli 명령으로 Update
```
esxcli --server=10.0.0.1 --username=root --password=암호 software vib update --depot=/vmfs/volumes/datastore1/update-from-esxi5.0-5.0_update01.zip

Installation Result
   Message: The update completed successfully, but the system needs to be rebooted for the changes to be effective.
   Reboot Required: true
   VIBs Installed: VMware_bootbank_ehci-ehci-hcd_1.0-3vmw.500.1.11.623860, VMware_bootbank_esx-base_5.0.0-1.11.623860, V
... 생략 ...
_2.0.2.0088-1vmw.500.1.11.623860, VMware_bootbank_uhci-usb-uhci_1.0-3vmw.500.0.0.469512
```

* vSphere Host를 Reboot
```
vicfg-hostops.pl --server 10.0.0.1 --username=root --password=암호 --operation reboot
Host 10.0.0.1 rebooted successfully.
```
* reboot 완료된 vSphere Host를 Maintenance 모드에서 일반 모드로 변경
```
vicfg-hostops.pl --server 10.0.0.1 --username=root --password=암호 --operation exit
Host 10.0.0.1 exited from maintenance mode successfully.
```
* 업그레이드 완료: 서버에 남아 있는 패치파일을 삭제해 준다.

## 4.x

* 4.0 --> 4.1
```
vihostupdate.pl --install -b c:\temp\upgrade-from-ESXi4.0-to-4.1.0-0.0.260247-release.zip --username root --verbose --server 10.0.0.1
```

* 4.1 --> 4.1 update1
```
vihostupdate.pl --install -b c:\temp\update-from-esxi4.1-4.1_update01.zip --username root --verbose --server 10.0.0.1
```

## VMware vSphere Client

### Enable Copy and Paste operation

1. Log into a vCenter Server system using the vSphere Client and select the virtual machine.
1. On the Summary tab, click Edit Settings.
1. Select Options > Advanced > General and click Configuration Parameters.
1. Click Add Row and type the following values in the Name and Value columns.
```
isolation.tools.copy.disable      false
isolation.tools.paste.disable     false
```
