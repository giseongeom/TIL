## icacls 사용 예제

### 일반 계정

* ``NSFT\user`` 계정에게 ``e:\폴더``의 모든 파일/폴더의 Full Control 권한 부여
```
icacls e:\폴더 /grant "NSFT\user":(OI)(CI)(F) /T /C
```

### 시스템 계정

* ``IIS_IUSRS`` 그룹
```
icacls d:\폴더 /grant "BUILTIN\IIS_IUSRS:(OI)(CI)(F)" /T /C 
icacls d:\폴더 /grant "NT AUTHORITY\IUSR:(OI)(CI)(F)" /T /C 
```

* ``Network Service`` 계정
```
icacls d:\폴더 /grant "NT AUTHORITY\NETWORK SERVICE:(OI)(CI)(F)" /T /C 
```

* ``Authenticated Users`` (모든 인증된 사용자)
```
icacls d:\폴더 /grant "NT AUTHORITY\Authenticated Users:(OI)(CI)(F)" /T /C 
```

* ``Everyone`` 모든 사용자 허용
```
icacls d:\폴더 /grant "everyone:(OI)(CI)(F)" /T /C 
```

### 보안설정 초기화

* 상위 폴더의 설정을 이용해서 초기화
```
icacls d:\폴더\*.* /reset /T /C
```

### Powershell 에서 icacls 명령 사용할 때 `--%` 필수

* 예제
```
icacls --% D:\폴더 /grant everyone:(OI)(CI)(F) /T /C 
```

## 참고자료

* [About Parsing](https://msdn.microsoft.com/en-us/powershell/reference/5.0/microsoft.powershell.core/about/about_parsing)
