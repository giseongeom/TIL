# registry 관리

## `reg.exe`

* RDP Network Level Authentication(NLA)
  * 현재 설정을 확인
```
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v SecurityLayer
```

  * Disable RDP NLA
```
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v SecurityLayer /d 0 /f
```
