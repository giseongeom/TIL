# Environment Variable #

## User-level ##

### Application Data, 관련 파일 저장소 ###

* `%APPDATA%`
  - 시스템 권한으로 설치된 프로그램들이 사용자별 데이터를 저장할 때 사용하는 경로임
  - 예
    - `%APPDATA%\Sublime Text 2\` : Sublime Text 2의 Extension, 설정이 저장됨
* `%LOCALAPPDATA%`
  - 임시데이터 파일 또는 캐시 파일들이 여기에 저장됨
    - `%TEMP%` 변수로 참조되는 폴더도 여기에 위치
  - 특정 사용자에 한정해서 설치되는 프로그램의 경우, 이 경로에 프로그램 실행파일을 저장함
  - 예
    - WSL (Windows Subsystem for Linux)의 배포판 환경파일


    - `%TEMP%'는 실제로 '%LOCALAPPDATA%\Temp'

* 예제
```text
C:\>echo %APPDATA%
C:\Users\giseong.eom\AppData\Roaming

C:\>echo %LOCALAPPDATA%
C:\Users\giseong.eom\AppData\Local
```


## 참고자료 ##

* [Windows Environment Variables](http://ss64.com/nt/syntax-variables.html)