# Environment Variable 환경변수 #

## User-level ##

### Application Data, 관련 파일 저장소 ###

* `%APPDATA%`
  - 시스템 권한으로 설치된 프로그램들이 사용자별 데이터를 저장할 때 사용하는 경로임
  - `%APPDATA%\Sublime Text 2\` : Sublime Text 2의 Extension, 설정이 저장됨
* `%LOCALAPPDATA%`
  - 임시데이터 파일 또는 캐시 파일들이 여기에 저장됨
    - `%TEMP%` 변수로 참조되는 폴더도 여기에 위치 - '%LOCALAPPDATA%\Temp'
  - 특정 사용자에 한정해서 설치되는 프로그램의 경우, 이 경로에 프로그램 실행파일을 저장함
  - WSL (Windows Subsystem for Linux)의 리눅스 배포본 파일이 이 경로에 저장됨


### 환경변수 추가

* setx 이용
```
setx JAVA_HOME C:\APP\java
```

### 환경변수 삭제

* setx 이용
환경변수 내용을 삭제 (Variable 자체는 삭제되지 않음. 값만 비워짐)
```
setx JAVA_HOME "" 
```

* 환경변수 내용 + 값 모두 삭제
```
REG delete HKCU\Environment /F /V JAVA_HOME
```




## 참고자료 ##

* [Windows Environment Variables](http://ss64.com/nt/syntax-variables.html)
