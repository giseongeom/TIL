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

