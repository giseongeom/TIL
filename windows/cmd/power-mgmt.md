## 전원 정책의 설정

### powercfg

* 항상 관리자 권한으로 실행해야 한다.
* Power Plan 나열
```
C:\Windows\system32>powercfg /L

기존 전원 구성표(* Active)
-----------------------------------
전원 구성표 GUID: 381b4222-f694-41f0-9685-ff5bb260df2e  (균형 조정) *
전원 구성표 GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (고성능)
전원 구성표 GUID: a1841308-3541-4fab-bc81-f71556f20b4a  (절전)
```

* Power Plan 변경
```
C:\Windows\system32>powercfg /SETACTIVE 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

C:\Windows\system32>powercfg /l

기존 전원 구성표(* Active)
-----------------------------------
전원 구성표 GUID: 381b4222-f694-41f0-9685-ff5bb260df2e  (균형 조정)
전원 구성표 GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (고성능) *
전원 구성표 GUID: a1841308-3541-4fab-bc81-f71556f20b4a  (절전)
```


## 기타

* 2014년 자료