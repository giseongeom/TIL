## Github 저장소의 DownloadURL 정보 추출

### ``powershell`` 프로젝트 기준 
* jq 의 기본 필터와 select 내장함수를 사용
    * ``content_type`` 이 ``application/x-rpm``인 파일의 browser_download_url 정보만 추출 (RHEL 호환)

### Linux
* select 함수 이용
```
curl -s https://api.github.com/repos/Powershell/Powershell/releases/latest  \
 | jq '.assets'  | jq '.[] | select(.content_type == "application/x-rpm")'  \
 | jq ".browser_download_url"

"https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.14/powershell-6.0.0_alpha.14-1.el7.centos.x86_64.rpm"
```
* match 함수 이용해서 .rpm 파일 URL 얻는 꽁수 (grep 이랑 별 차이 없음)
```
$ curl -s https://api.github.com/repos/Powershell/Powershell/releases/latest \
 | jq ".assets[].browser_download_url" \
 | jq 'match("^.*rpm").string'

"https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.14/powershell-6.0.0_alpha.14-1.el7.centos.x86_64.rpm"
```

### Windows 
* cmd 에서 실행 (Double Quote의 escape 처리에 주의)
```
curl -s https://api.github.com/repos/Powershell/Powershell/releases/latest 
 | jq ".assets" 
 | jq ".[] | select(.content_type == \"application/x-rpm\")" 
 | jq ".browser_download_url"

"https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.14/powershell-6.0.0_alpha.14-1.el7.centos.x86_64.rpm"
```



### 참고자료
* [jq Tutorial](https://stedolan.github.io/jq/tutorial/)
* [jq Manual (development version)](https://stedolan.github.io/jq/manual/)