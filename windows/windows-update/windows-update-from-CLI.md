## Windows Update from CLI


### pre-windows 8.1

* `wuauclt /detectnow`


### Windows 10

* powershell 
```powershell
(New-Object -ComObject Microsoft.Update.AutoUpdate).DetectNow()
```

### Windows Server 2016 Nano

* powershell
```powershell
$ci = New-CimInstance -Namespace root/Microsoft/Windows/WindowsUpdate -ClassName MSFT_WUOperationsSession  
$result = $ci | Invoke-CimMethod -MethodName ScanForUpdates -Arguments @{SearchCriteria="IsInstalled=0";OnlineScan=$true}
$result.Updates
```


## 참고자료

* [Updating Nano Server](https://docs.microsoft.com/en-us/windows-server/get-started/update-nano-server)
* [Run Windows Update from command-line / manually cause update check](https://social.technet.microsoft.com/Forums/windows/en-US/c18a95b4-2235-49e8-a1b2-fb47bd0111ab/run-windows-update-from-commandline-manually-cause-update-check?forum=win10itprogeneral)
