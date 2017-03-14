# Hardware manipulation

## USB

* DeviceID가 USB인 장치 정보 찾기
```powershell
Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.DeviceID -like 'USB*' } | ft DeviceID, Caption -AutoSize


DeviceID                                      Caption
--------                                      -------
USB\VID_045E&PID_0745&MI_00\7&15A9BB96&0&0000 Microsoft Hardware USB Keyboard
USB\VID_8087&PID_0024\5&324A4BC&0&1           Generic USB Hub
USB\VID_0408&PID_2FB1&MI_00\7&39E017E4&0&0000 Integrated Webcam
USB\VID_045E&PID_0745\6&16A13F70&0&4          Microsoft Mouse and Keyboard Detection Driver (USB)
USB\VID_045E&PID_0745&MI_01\7&15A9BB96&0&0001 Microsoft Hardware USB Mouse
USB\VID_8086&PID_0189\6&166E8A4C&0&5          Intel(R) Centrino(R) Wireless Bluetooth(R) 3.0 + H...
USB\ROOT_HUB30\5&22C35228&0&0                 USB Root Hub (xHCI)
USB\VID_045E&PID_0745&MI_02\7&15A9BB96&0&0002 USB Input Device
USB\ROOT_HUB20\4&3551E42A&0                   USB Root Hub
USB\VID_8087&PID_0024\5&3547B97D&0&1          Generic USB Hub
USB\ROOT_HUB20\4&304566E4&0                   USB Root Hub
USB\VID_0408&PID_2FB1\6&252D4A22&0&4          USB Composite Device
```



## RAM

### 메모리 상태(Status) 체크

* 일반 PC
```powershell
gwmi -Class CIM_PhysicalMemory `
  | Select-Object Name, @{Label='Size(GB)';Expression={$_.Capacity/1048576}}, Speed, Status `
  |ft -Autosize

Name            Size(GB) Speed Status
----            -------- ----- ------
Physical Memory     2048  1333
Physical Memory     2048  1333
Physical Memory     2048  1333
Physical Memory     2048  1333
Physical Memory     2048  1333
Physical Memory     2048  1333
Physical Memory     2048  1333
Physical Memory     2048  1333
```
* Dell PowerEdge R510 (Dell OMSA installed)
```powershell
gwmi -Namespace root\cimv2\dell -Class CIM_PhysicalMemory `
 | Select-Object Name, @{Label='Size(GB)';xpression={$_.Capacity/1048576}}, Speed, Status `
 |ft -Autosize

Name     Size(GB) Speed Status
----     -------- ----- ------
DIMM_A1      2048  1333 OK
DIMM_A2      2048  1333 OK
DIMM_A3      2048  1333 OK
DIMM_A4      2048  1333 OK
DIMM_B1      2048  1333 OK
DIMM_B2      2048  1333 OK
DIMM_B3      2048  1333 OK
DIMM_B4      2048  1333 OK
```
