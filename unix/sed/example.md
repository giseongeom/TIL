## Sed 예제

## 파일 뒤에 Append 할 때

### memcached.conf 수정

* `memcached.conf` 파일 수정 예제
* 1칸 공백 주고, 주석 및 옵션 내용을 추가함 (총 3줄)
```bash
sed -i -e '$ a\\n\# Support slab reassign \n-o slab_reassign,slab_automove' /etc/memcached.conf
```
* 수정된 파일 내용
```

# Support slab reassign
-o slab_reassign,slab_automove
```


## 참고자료

* [Unix Sed Tutorial: Append, Insert, Replace, and Count File Lines](https://www.thegeekstuff.com/2009/11/unix-sed-tutorial-append-insert-replace-and-count-file-lines/?ref=driverlayer.com)
* [Sed Command in Linux - Append and Insert Lines to a File](http://www.yourownlinux.com/2015/04/sed-command-in-linux-append-and-insert-lines-to-file.html)
* [How to add a carriage return before every newline?](https://unix.stackexchange.com/questions/153091/how-to-add-a-carriage-return-before-every-newline)