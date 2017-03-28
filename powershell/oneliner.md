
# One-liner

## 목록 만들기

* PDF 책 목록 만들기 - Create ebook(.pdf) list
```
powershell -executionpolicy bypass 
 -command "(dir M:\ebook\scanned -Recurse -Filter "*.pdf").Name | 
  sort-object -Unique| Out-File -Encoding utf8 -FilePath $env:userprofile'\Dropbox\scanned.booklist.txt'"
```