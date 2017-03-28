# Disk, Partition, Volume

## Disk

### Disk Initialize

* clear
```
PS> get-disk -Number 1 | ft -AutoSize

Number Friendly Name           Serial Number   HealthStatus OperationalStatus Total Size Partition Style
------ -------------           -------------   ------------ ----------------- ---------- ---------------
1      Samsung SSD 850 PRO 1TB S259NXAH200072X Healthy      Online             953.87 GB MBR            

PS> clear-disk -Number 1 -Verbose -RemoveData -RemoveOEM
```

* MBR 타입으로 초기화
```
Initialize-Disk -Number 1 -Verbose -PartitionStyle mbr
```

## Partition

### Partition 생성/포맷

* 최대크기로 생성
```
New-Partition -DiskNumber 1 -UseMaximumSize -Verbose
```

* DriveLetter `D:` 지정
```
Get-Partition -DiskNumber 1 | set-Partition -NewDriveLetter D
```

* ReFS로 Quick Format (DriveLetter 없는 경우)
```
Format-Volume -Partition (Get-Partition -DiskNumber 1) -FileSystem ReFS -NewFileSystemLabel D1 -Verbose 
```

* ReFS로 Quick Format (DriveLetter 이미 있는 경우)
```
Format-Volume -DriveLetter D -FileSystem ReFS -NewFileSystemLabel D1 -Verbose
```

###  Partition 확장

* 확장
```powershell
Resize-Partition -DiskNumber 1 -PartitionNumber 1 `
  -Size (Get-PartitionSupportedSize -DiskNumber 1 -PartitionNumber 1).SizeMax
```

* 확장된 Partition 확인
```powershell
Get-Partition -DiskNumber 1 -PartitionNumber 1

   Disk Number: 1

PartitionNumber  DriveLetter Offset                                        Size Type
---------------  ----------- ------                                        ---- ----
1                D           1048576                                  931.51 GB IFS
```