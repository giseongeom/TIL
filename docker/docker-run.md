## docker run 명령 옵션 정리

### ``--isolation`` 은 Windows 환경 전용

* Linux 에서는 ``default`` 만 선택할 수 있음. 
* Windows 에서는 ``process`` 또는 ``hyperv``를 선택할 수 있음
  * Client (Windows 10)에서는 기본값이 ``hyperv`` - 즉 Hyper-V Container를 기본 실행
  * Server (Windows Server 2016)에서는 기본값이 ``process`` - Windows Container를 기본 실행

## 참고자료

* [docker run](https://docs.docker.com/engine/reference/commandline/run/)