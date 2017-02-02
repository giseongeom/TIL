# 자동로그인(autologin)

## 자동로그인 설정

### netplwiz

* Windows 시작 -> 실행: `netplwiz` 또는 `control userpasswords2` 실행
* 워크그룹 환경의 Windows 장비에서 사용가능
* 도메인 환경에서는 사용 불가. 
  * 레지스트리를 사용해야 한다.

### 레지스트리

* `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon` 에서 다음 내용을 추가
  * AutoAdminLogon: `1`
  * DefaultDomainName: `AD Domain name` 또는 `hostname` 
  * DefaultUserName: `Username`
  * DefaultPassword: 암호

* 암호를 문자열로 노출시키므로 보안에는 취약함.



## 자동로그인 딜레이

* 배경
  * 부팅 즉시, 로그온 시도하면 네트워크 리소스들이 준비되지 못할 수 있다. 또는 필요한 서비스들.
  * 따라서, 일정 시간을 기다렸다가 로그인되도록 하는 것이 안전함.


* Always wait for the network at computer startup and logon
```
Computer Configuration" -> "Administrative Templates" -> "System"
 -> "Logon" -> "Always wait for the network at computer startup and logon"
```

* Startup policy processing wait time
```
Computer Configuration" -> "Administrative Templates" -> "System"
 -> "Group Policy" -> set "Startup policy processing wait time" to 120.
```

## 화면잠금 

* 로그인된 사용자 화면을 그대로 방치하면 누가 장난칠 수 있음.
* 자동으로 화면 잠금을 설정하는 것이 좋음.
* GPO로 시간을 정할 수도 있음. 하지만, 명령어를 이용해서 즉시 잠글 수 있음
```
rundll32.exe user32.dll,LockWorkStation
```


## 참고자료

* [How to Automatically Sign in to User Account at Startup in Windows 10](https://www.tenforums.com/tutorials/3539-sign-user-account-automatically-windows-10-startup.html)
* [How to delay Windows 7 autologon, so that the Domain will be available?](http://superuser.com/questions/328739/how-to-delay-windows-7-autologon-so-that-the-domain-will-be-available)
* [Tips for Techies: Create a Lock Workstation shortcut](https://technet.microsoft.com/en-us/library/cc750823.aspx)

