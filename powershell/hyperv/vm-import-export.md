# VM Import/Export

## Import-VM


* `-Path`: 인자로 .xml 지정, Pipe로 전달 가능함 (string)
* `-Register`: 머신을 그대로 이동할 때 사용해야 한다. (중요!)
```powershell
<pre>
PS E:\vm> dir *.xml -Recurse | % { $_.FullName | Import-VM -Register -Confirm -Verbose }

Confirm
Are you sure you want to perform this action?
Import-VM will import the virtual machine saved at "E:\vm\Image - Windows 7 (64-bit) Korean\Virtual
Machines\7B5898A5-C95E-4FB5-9964-0B0D813881A5.XML".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"):


Confirm
Are you sure you want to perform this action?
Import-VM will import the virtual machine saved at "E:\vm\Image - Windows 8.1 (64-bit)\Virtual
Machines\3218776B-0148-4594-AEAB-26D7B43D0045.XML".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"):

Confirm
Are you sure you want to perform this action?
Import-VM will import the virtual machine saved at "E:\vm\TERABox\Virtual
Machines\329A849F-7D1D-44A3-82AC-3E95B75B13D0.XML".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"):
Name                              State CPUUsage(%) MemoryAssigned(M) Uptime   Status
----                              ----- ----------- ----------------- ------   ------
Image - Windows 7 (64-bit) Korean Off   0           0                 00:00:00 Operating normally
Image - Windows 8.1 (64-bit)      Off   0           0                 00:00:00 Operating normally
TERABox                           Off   0           0                 00:00:00 Operating normally


PS E:\vm> f:
PS F:\> dir *.xml -Recurse | % { $_.FullName | Import-VM -Register -Verbose }
VERBOSE: Import-VM will import the virtual machine saved at "F:\VM\Image - Windows Server 2008 R2\Virtual
Machines\78B1052F-70E4-42D6-BED4-2ADB3E28E015.XML".

VERBOSE: Import-VM will import the virtual machine saved at "F:\VM\Image - Windows Server 2012 R2\Virtual
Machines\4DC56611-0337-45A9-B03C-833E2A1C4C35.XML".
VERBOSE: Import-VM will import the virtual machine saved at "F:\VM\vNAT\Virtual
Machines\4AE80F48-DF51-4FE3-ADFD-D40DF539F8FA.XML".
VERBOSE: Import-VM will import the virtual machine saved at "F:\VM\vNATw\Virtual
Machines\B0EFAC47-9990-4ADE-838C-E33643928D0D.XML".
Name                           State CPUUsage(%) MemoryAssigned(M) Uptime   Status
----                           ----- ----------- ----------------- ------   ------
Image - Windows Server 2008 R2 Off   0           0                 00:00:00 Operating normally
Image - Windows Server 2012 R2 Off   0           0                 00:00:00 Operating normally
vNAT                           Off   0           0                 00:00:00 Operating normally
vNATw                          Off   0           0                 00:00:00 Operating normally
```

