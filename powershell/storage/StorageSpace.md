# Storage Space 

## Simple Storage Pool 생성

### Pool 생성 및 디스크 추가

* 1TB Disk x 2개 사용
* Storage Pool 생성 `LAB-VM-Pool`
```powershell
New-StoragePool -FriendlyName "LAB-VM-Pool" `
  -StorageSubSystemUniqueId (Get-StorageSubSystem).uniqueID `
  -PhysicalDisks (Get-PhysicalDisk -CanPool $true)

FriendlyName OperationalStatus HealthStatus IsPrimordial IsReadOnly
------------ ----------------- ------------ ------------ ----------
LAB-VM-Pool  OK                Healthy      False        False
```

* 생성된 Pool에 `VM` 이라는 Virtual Disk 생성 - `Stripe, 2 Column`
```powershell
New-VirtualDisk -StoragePoolFriendlyName LAB-VM-Pool -FriendlyName VM `
  -ResiliencySettingName Simple -NumberOfColumns 2 -UseMaximumSize -Verbose

FriendlyName ResiliencySettingName OperationalStatus HealthStatus IsManualAttach    Size
------------ --------------------- ----------------- ------------ --------------    ----
VM           Simple                OK                Healthy      False          1.82 TB
```

* 디스크를 GPT로 초기화, 파티션 생성하고 ReFS로 포맷하고 `T` 드라이브 할당
```powershell
Initialize-Disk -Number 4 -Verbose -PartitionStyle GPT
get-disk -Number 4 | ft -AutoSize

Number Friendly Name Serial Number                          HealthStatus OperationalStatus Total Size Partition Style
------ ------------- -------------                          ------------ ----------------- ---------- ---------------
4      VM            {7bd55eed-70aa-4ff6-831a-3ec689151147} Healthy      Online               1.82 TB GPT


New-Partition -DiskNumber 4 -UseMaximumSize -Verbose

   DiskPath: \\?\storage#disk#{7bd55eed-70aa-4ff6-831a-3ec689151147}#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}

PartitionNumber  DriveLetter Offset                                        Size Type
---------------  ----------- ------                                        ---- ----
2                            134238208                                  1.82 TB Basic


Get-Partition -DiskNumber 4


   DiskPath: \\?\storage#disk#{7bd55eed-70aa-4ff6-831a-3ec689151147}#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}

PartitionNumber  DriveLetter Offset                                        Size Type
---------------  ----------- ------                                        ---- ----
1                            17408                                       128 MB Reserved
2                            134238208                                  1.82 TB Basic


Format-Volume -Partition (Get-Partition -DiskNumber 4 -Number 2) `
  -FileSystem ReFS -NewFileSystemLabel VM -Verbose

DriveLetter FileSystemLabel FileSystem DriveType HealthStatus OperationalStatus SizeRemaining    Size
----------- --------------- ---------- --------- ------------ ----------------- -------------    ----
            VM              ReFS       Fixed     Healthy      OK                       1.8 TB 1.82 TB

Get-Partition -DiskNumber 4 -Number 2 | Set-Partition -NewDriveLetter T -Verbose
```
