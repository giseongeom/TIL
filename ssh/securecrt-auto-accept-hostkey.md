## SecureCRT 에서 Hostkey 변경되었을 때 자동으로 저장

* 보안상 좋은 관행은 아님

### 설정

* ``SSH2.ini`` 파일을 찾아서 다음의 내용을 추가한다.
```
D:"Automatically Accept Host Keys"=00000001
```
* Windows 에서는 보통 ``%APPDATA%\VanDyke\Config`` 폴더에 있음



### 참고자료

* [VanDyke Software Forums - General - How to automatically accept keys?](https://s2-forums.vandyke.com/showthread.php?p=44808)