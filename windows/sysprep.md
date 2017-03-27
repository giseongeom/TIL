# Sysprep

## Turn off the Network Location wizard

* Create the following RegKey `HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff`
```
reg add HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff
```

## DisableLoopbackCheck

* 콘솔에서 `\\TERAFILE\Gold` 같이 Alias 이름으로 접근할려면 필요
* `HKLM\SYSTEM\CurrentControlSet\Control\Lsa`
* Create REG_DWORD with name DisableLoopbackCheck and value 1
```
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v DisableLoopbackCheck /t REG_DWORD /d 1 /f
```

## 참고자료

* [Turn off the Network Location wizard[(https://technet.microsoft.com/en-us/library/gg252535(WS.10).aspx?ppud=4)
* [A "Set Network Location" dialog box appears when you first log on to a domain-joined Windows 7-based client computer](https://support.microsoft.com/kb/2028749/en-us)
* [Windows Server 2012 UNC Path using Alias (CNAME) on local server prompt for credentials](http://goo.gl/XcXRDf)
* [DisableLoopbackCheck. Lets do it the right way](http://blogs.technet.com/b/sharepoint_foxhole/archive/2010/06/21/disableloopbackcheck-lets-do-it-the-right-way.aspx)