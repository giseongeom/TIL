# Deduplication

## Deduplication Status 체크

* 여러 대의 Remote 장비 Dedup. 상태 체크

```powershell
icm -ScriptBlock  { Get-dedupstatus |select Volume, @{Label='Used(TB)';Expression={[Math]::Round($_.UsedSpace/1TB,2)}}, @{Label='Saved(TB)';Expression={[Math]::Round($_.SavedSpace/1TB,2)}} } `
  -ComputerName Computer-01, Computer-02, Computer-03

Volume         : D:
Used(TB)       : 1.53
Saved(TB)      : 21.46
PSComputerName : Computer-03
RunspaceId     : 7e775caf-1aaa-47c2-b09d-f2030a4a2ad7

Volume         : D:
Used(TB)       : 0.38
Saved(TB)      : 2.26
PSComputerName : Computer-02
RunspaceId     : 4f422f87-9b9a-4798-b55e-089a1da00a02

Volume         : E:
Used(TB)       : 0.41
Saved(TB)      : 3.49
PSComputerName : Computer-02
RunspaceId     : 4f422f87-9b9a-4798-b55e-089a1da00a02

Volume         : F:
Used(TB)       : 0.42
Saved(TB)      : 6.13
PSComputerName : Computer-02
RunspaceId     : 4f422f87-9b9a-4798-b55e-089a1da00a02

Volume         : D:
Used(TB)       : 3.77
Saved(TB)      : 12.79
PSComputerName : Computer-01
RunspaceId     : 252f4bde-e73a-41b2-8cea-52e9b85f3d50
```