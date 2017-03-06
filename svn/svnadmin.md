# SVN (Subversion) Administration

## svnserve 이용한 서비스 등록

* `c:\svn-repos` 저장소 폴더를 사용한다.
* Service Name: `svn.local`
* 서비스 표시 이름(Display Name): `Subversion Repository`

```batch
sc create svn.local binpath= "\"C:\Program Files\SlikSvn\bin\svnserve.exe\" --service --root c:\svn-repos" displayname= "Subversion Repository" depend= Tcpip
```


## 참고자료

* http://wiki.bitnami.org/Components/Subversion
* http://svnbook.red-bean.com/en/1.1/ch06s04.html
* [Performance tuning Subversion](http://www.ibm.com/developerworks/java/library/j-svnbins/index.html)
* [Apache Subversion 1.6 Release Notes (Filesystem Storage Improvements)](http://subversion.apache.org/docs/release-notes/1.6.html#filesystem-improvements)
* [How to find out Subversion repository version?](http://stackoverflow.com/questions/282460/how-to-find-out-subversion-repository-version)


## 기타

* 2011년 자료

