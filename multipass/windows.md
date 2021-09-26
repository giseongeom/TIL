


```PowerShell

sc.exe stop multipass
sc.exe --% config multipass binPath= "\"C:\Program Files\Multipass\bin\multipassd.exe\" /svc"
[SC] ChangeServiceConfig SUCCESS
```
