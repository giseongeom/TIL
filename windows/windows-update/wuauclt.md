# wuauclt usage

## Client 삭제 - 재등록

* WSUS 콘솔에서 해당 Client 삭제
* Client에서 관리자 권한의 cmd 실행하고, 다음의 wuauclt.exe 명령을 실행
```
wuauclt.exe /ResetAuthorization
wuauclt.exe /ReportNow
```
* WSUS 콘솔에서 해당 Client가 다시 표시되는 것 확인

## 참고자료

* [Appendix H: The wuauclt Utility](https://technet.microsoft.com/en-us/library/cc720477(v=ws.10).aspx)