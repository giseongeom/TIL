# cygwin

## Automated Install

* Automated cygwin install
https://github.com/rtwolf/cygwin-auto-install

## Package Management

### apt-cyg

* 설치
```
$ svn --force export http://apt-cyg.googlecode.com/svn/trunk/ /bin/

A    /bin
A    /bin/LICENSE
A    /bin/apt-cyg
A    /bin/README.md
Exported revision 34.
```

* 미러 사이트 지정
```
$ apt-cyg update -m http://ftp.daum.net/cygwin
```

* 패키지 설치
```
$ apt-cyg install util-linux
```

### 필수 Package

* util-linux: more 명령을 제공
* psmisc: pstree 명령을 제공
* subversion
* git
* ncurses
* procps : pgrep, pkill 명령 제공
* rsync
* perl
* python
* ruby
* vim
* screen
* openssh


## Service Management

### cygrunsrv

* squidcache - squid 서비스 등록
```
cygrunsrv -I squidcache -f "Squid Proxy Server" -p /usr/sbin/squid.exe -a "-N -D -d1"
```

* squidcache - squid 서비스 삭제
```
cygrunsrv -R squidcache
```


## 참고자료

* Compiling Squid
http://wiki.squid-cache.org/SquidFaq/CompilingSquid
* Feature: HTTPS (HTTP Secure or HTTP over SSL/TLS)
http://wiki.squid-cache.org/Features/HTTPS

