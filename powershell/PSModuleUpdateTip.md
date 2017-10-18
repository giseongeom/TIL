# PS Module Update 팁
* Powershell 5.1 기준

## 설치된 Module 정보 확인 / 구버전 삭제
```powershell
Get-InstalledModule | ft -AutoSize
foreach ($module in $my_psmodule_installed) {
  Get-InstalledModule -Name $module.Name -AllVersions | 
  ? { $_.Version -ne $module.Version } | 
  Uninstall-Module -Verbose -Force 
}


```

## 참고자료

* [Update-module needs flag to remove previous versions](https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/14934876-update-module-needs-flag-to-remove-previous-versio)