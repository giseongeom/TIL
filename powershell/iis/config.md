# IIS Configuration


## HomeDir 변경

* Default Web Site의 Home 경로를 D:\ProjectRoot로 변경
```PowerShell
set-ItemProperty 'IIS:\Sites\Default Web Site' -Name PhysicalPath -Value D:\ProjectRoot
```

## MIME 설정에 `.ini` 확장자 추가

### IIS Server 수준

* `.ini` 확장자를 추가
```PowerShell
Add-webconfigurationproperty `
 -PSPath MACHINE/WEBROOT/APPHOST `
 -Filter system.webServer/staticContent `
 -Name "." `
 -value @{fileExtension='.ini'; mimeType='text/plain'}
```

* `.ini` 확장자가 추가되었는지 확인
```PowerShell
(Get-WebConfiguration -PSPath 'MACHINE/WEBROOT/APPHOST' //staticcontent).collection  | ? {$_.fileextension -eq '.ini'}
```

* `.ini` 확장자를 삭제
```PowerShell
Remove-webconfigurationproperty `
 -PSPath MACHINE/WEBROOT/APPHOST `
 -Filter system.webServer/staticContent `
 -Name "." `
 -AtElement @{fileExtension='.ini'; mimeType='text/plain'}

```

### IIS Site 수준

* `.ini` 확장자를 추가
```PowerShell
Add-webconfigurationproperty `
 -PSPath 'MACHINE/WEBROOT/APPHOST/Default Web Site' `
 -Filter system.webServer/staticContent `
 -Name "." `
 -value @{fileExtension='.ini'; mimeType='text/plain'}
```

* `.ini` 확장자가 추가되었는지 확인
```PowerShell
(Get-WebConfiguration -PSPath 'MACHINE/WEBROOT/APPHOST/Default Web Site' //staticcontent).collection  | ? {$_.fileextension -eq '.ini'}
```

* `.ini` 확장자를 삭제
```PowerShell
Remove-webconfigurationproperty `
 -PSPath 'MACHINE/WEBROOT/APPHOST/Default Web Site' `
 -Filter system.webServer/staticContent `
 -Name "." `
 -AtElement @{fileExtension='.ini'; mimeType='text/plain'}
```


## 참고자료

* http://stackoverflow.com/questions/18151928/how-do-i-remove-iis-custom-header-using-powershell
* http://stackoverflow.com/questions/28431497/powershell-check-mime-exists-in-iis
* https://forums.iis.net/t/1192371.aspx
* http://sclarson.blogspot.kr/2011/08/adding-mime-type-to-iis-vis-powershell.html
* http://www.markrainey.me/2013/05/dnscmd-examples.html
* https://blogs.technet.microsoft.com/heyscriptingguy/2014/07/31/exclude-delayed-start-services-when-checking-status-with-powershell/
* http://metah.ch/blog/2012/09/how-to-change-a-service-startup-type-with-powershell/

