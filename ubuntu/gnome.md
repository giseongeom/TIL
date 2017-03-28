


* 14.04 에서 `Minimize Window` 했을 때 시스템이 일시적 hang 상태에 빠지는 문제
* 원인
```
I found out that it is caused by gnome settings in your home directory. 
So reinstalling ubuntu won't help to fix it.
below command have solved the issue for me:

gsettings set org.gnome.desktop.background show-desktop-icons true
```

* 설정
```
$ gsettings set org.gnome.desktop.background show-desktop-icons true
```


## 참고자료
* [System becomes unresponsive, ibus-ui-daemon takes ~150 % cpu](https://bugs.launchpad.net/ubuntu/+source/ibus/+bug/1276186)