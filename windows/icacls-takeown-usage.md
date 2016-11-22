## icacls, takeown 이용한 폴더/파일의 권한제어
* 모든 작업은 Administrator 권한의 cmd 에서 진행해야 합니다.

### takeown

* 특정 폴더 (``C:\ProgramData\whoru``)의 소유권(ownership)을 현재 실행계정으로 변경할 때
```
takeown /F C:\ProgramData\whoru /D Y /R
```
  * Prompt에 대해서 무조건 yes로 응답하도록 ``/D Y`` 지정
  * Recursive 하게 적용하도록 ``/R`` 적용


### icacls

* 모든 사용자에 대해서 접근거부 설정. 동시에 상위폴더에서의 권한 상속을 차단함.
```
icacls C:\ProgramData\whoru /deny Everyone:F /inheritance:r
```
* 권한 설정을 초기화하고, 상위 폴더에서 상속받도록 재설정
```
icacls C:\ProgramData\whoru /reset
```


### 기타 
* 생산성에 영향주는 보안프로그램이 있을 때 적용가능한 팁
  * 폴더/파일 리소스는 ownership 이 우선한다.
  * Deny 권한은 Allow 보다 우선한다.