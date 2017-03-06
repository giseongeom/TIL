# VMware Workstation 9 에서 TERA 실행

## 준비해야 할 것
* VMware Workstation 9 


## 세부 내용

* 2012.09.07 기준

테스트 플랫폼 | 테스트 결과 | Description
------------ | ---------- | ----------
Windows XP Professional with SP3 (32-bit) | failed | 플레이 진행됨 but, 재부팅하면 BSOD 발생
Windows XP Professional with SP2 (64-bit) | failed | 플레이 불가
Windows 7 Enterprise with SP1 (64-bit) | passed | 문제없음
Windows 8 Enterprise RTM (64-bit) | passed | 문제없음


### 설정한 내용

* VMware Tools 설치된 상태에서 아래의 레지스트리 수정
```
HKLM/SYSTEM/CurrentControlSet/Control/Class/{4D36E968-E325-11CE-BFC1-08002BE10318}/0000
```

* `DriverDesc` 의 값이 `VMware SVGA` 로 설정되어 있다. (기본값)
* 이 값의 내용에서 VMware만 삭제한다. 그리고 셧다운
* 해당 VM의 .vmx 파일에 아래의 내용을 추가한다.
```
monitor_control.restrict_backdoor = "TRUE"
monitor_control.disable_directexec = "TRUE"
isolation.tools.getPtrLocation.disable = "TRUE"
isolation.tools.setPtrLocation.disable = "TRUE"
isolation.tools.setVersion.disable = "TRUE"
isolation.tools.getVersion.disable = "TRUE"
```

### 이슈

* VMware Tools 의 몇 가지 좋은 기능을 사용할 수 있다.
  * copy & paste 를 이용해서 파일을 복사할 수 없다.
  * Shared Folder 설정을 이용할 수 없다.
* Windows XP Professional with SP2 (64-bit) 에서는 실행불가
  * 오류 코드 0xFF05 표시되면서 실행 종료
  * `0xFF05: 0xXXXXXXXX(게임가드 오류코드)` - 부정행위검출 - `EndType2`는 게임가드 오류

## 참고자료

* 2012년 자료
* [VMware solution for themida protection](http://www.elitepvpers.com/forum/cabal-guides-templates/1418504-vmware-solution-themida-protection.html)
