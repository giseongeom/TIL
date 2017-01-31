# Convert-WindowsImage

## Usage

### Module loading
```
  . .\Convert-WindowsImage.ps1
```

### convert-windowsImage 실행
```
  Convert-WindowsImage -SourcePath c:\iso\example.iso 
   -Edition ServerDatacenterCore
   -VHDPath c:\vhd\example.vhdx
   -VHDFormat VHDX
   -SizeBytes 146GB
   -VHDPartitionStyle GPT
```
* VHDPartitionStyle을 MBR로 지정하면 Gen1 VM이 생성됨

### Edition

  * Client Enterprise: Enterprise
  * Server Standard: ServerStandard
  * Server Standard Core: ServerStandardCore
  * Server DataCenter: ServerDatacenter
  * Server DataCenter Core: ServerDatacenterCore
  * 평가판: **Edition** 지정할 때 `ServerStandardEval` 과 같이 **Eval** suffix가 추가됨


## 기타

* 2014년 자료