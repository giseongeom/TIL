# DISM example

## Package Installation

* TelnetClient
```
dism /online /enable-feature:TelnetClient
```

* SNMP
```
dism /Online /Enable-Feature /FeatureName:SNMP /All
```

* Desktop Experience
```
dism /Online /Enable-Feature /FeatureName:DesktopExperience /All
```

* File Server Role - Deduplication Feature
```
dism /online /enable-feature:Dedup-Core /all
```


### .NET Framework 3.5 설치

* Client
```
dism /Online /Enable-Feature /FeatureName:NetFx3 /All 
```

* Server (D: 드라이브에 원본이 있다고 가정)
```
dism /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:d:\sources\sxs
```

