# Code Sign


* Code Sign 준비
```powershell
$mycert = (dir cert:currentuser\my -CodeSigningCert)
$myTimestampURL = "http://timestamp.verisign.com/scripts/timstamp.dll"
```

* 현재 폴더의 hello.exe 서명
```powershell
Set-AuthenticodeSignature -Certificate $mycert `
  -TimestampServer $myTimestampURL -FilePath .\hello.exe
```

* 현재 폴더의 모든 exe 파일을 서명
```powershell
dir -filter *.exe | ForEach-Object { Set-AuthenticodeSignature `
  -Certificate $mycert -TimestampServer $myTimestampURL -FilePath $_ }
```

* 현재 폴더이하에서 모든 .exe 파일을 검색해서 코드사인 안되어 있는 파일들 출력
```powershell
dir *.exe -Recurse | ? { (Get-AuthenticodeSignature -FilePath $_).Status -ne 'Valid' } `
  | Select-Object -Property FullName
```

