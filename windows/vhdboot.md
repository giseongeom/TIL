## VHD Boot

### bcdedit 명령 예제

* 기존 Boot entry를 복사 (예제에서는 ``{5d8d8f36-84e3-11e4-89a8-af3fb607bf43}`` 사용)
```
C:\>bcdedit /copy {current} /d "CHUPC" 
The entry was successfully copied to {5d8d8f36-84e3-11e4-89a8-af3fb607bf43}.
```
* c:\vmstore\chu-pc.vhd 파일을 Bootable 하도록 지정
```
C:\>BCDEDIT /set {5d8d8f36-84e3-11e4-89a8-af3fb607bf43} device vhd=[c:]\vmstore\Chu-pc.vhd
The operation completed successfully.

C:\>BCDEDIT /set {5d8d8f36-84e3-11e4-89a8-af3fb607bf43} osdevice vhd=[c:]\vmstore\Chu-pc.vhd
The operation completed successfully.

C:\>BCDEDIT /set {5d8d8f36-84e3-11e4-89a8-af3fb607bf43} detecthal on
The operation completed successfully.
```


















## 기타

* 2014년 자료