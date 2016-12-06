## Windows cmd script에서 parent folder 정보를 사용

### .cmd / .bat 스크립트에서 현재 실행되는 스크립트 경로를 표시

* ``%~dp0`` : 현재 실행중인 스크립트의 폴더 (c:\temp\)
* ``%~f0``  : 현재 실행중인 스크립트의 전체 경로 (c:\temp\example.cmd)
  * example.cmd
```
@echo off
echo %%~dp0: %~dp0
echo %%~f0: %~f0
```
  * example.cmd 실행
```
giseong.eom@GISEONG-PC C:\temp
> example.cmd
%~dp0: C:\temp\
%~f0: C:\temp\example.cmd
```

### .cmd / .bat 스크립트에서 스크립트 상위의 폴더를 표시

* 위의 예제에서 ``c:\``를 표시하려면 어떻게 해야 할까?
  * example.cmd 를 다음과 같이 수정
```
@echo off
echo %%~dp0: %~dp0
echo %%~f0: %~f0
for %%i in ("%~dp0..") do set "parent=%%~fi"
echo parent: %parent%
```
  * example.cmd 실행
```
giseong.eom@GISEONG-PC C:\temp
> example.cmd
%~dp0: C:\temp\
%~f0: C:\temp\example.cmd
parent: C:\
```
* 설명
  * ``%~dp0..``의 정보가 ``%%i`` 변수에 저장됨 (``"C:\temp\.."``)
  * ``%~f``를 이용해서 경로를 해석하고, quotation marks를 제거한다. 끝으로 parent 변수에 저장됨 (``C:\``)



## 참고자료

* [Using batch parameters](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/percent.mspx?mfr=true)
* [How to get windows batch's parent folder](http://stackoverflow.com/questions/16623780/how-to-get-windows-batchs-parent-folder)