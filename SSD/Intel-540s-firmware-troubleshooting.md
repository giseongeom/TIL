# 인텔 540s SSD의 펌웨어 업그레이드 과정을 정리

## 인텔에서 공식적으로 지원하는 업그레이드 방법
* Intel SSD Firmware Update Tool (.iso) 파일을 다운로드 받아서 USB 또는 CD/DVD 로 굽는다(?)
* 만들어진 USB 또는 CD/DVD로 부팅해서 업그레이드를 진행한다.

## 문제점
* v2.1.6 .iso 파일로 만든 USB로 부팅하면, 검은색 화면이 나타난 다음 더 이상 진행되지 않음.
* 키보드 입력에 반응 없음.

## 해결방법
* 인텔에서 별도 제공한 iRMFUU 도구를 다운로드 받는다.
* 관리자(Administrator) 권한의 cmd 창에서 ``irmfuu_7.0.0.E.exe`` 실행해서 업그레이드 진행한다.

## 참고자료
* [SSD 540s firmware update failure|Intel Communities](https://communities.intel.com/thread/103273)
* [Download Intel SSD Firmware Update Tool](https://downloadcenter.intel.com/download/18363/Intel-SSD-Firmware-Update-Tool)
* [iRMFUU for Intel SSD 540s/Pro 5400s/E 5400s/DC S3100 Series FW Update](https://downloadcenter.intel.com/download/26378/iRMFUU-for-Intel-SSD-540s-Pro-5400s-E-5400s-DC-S3100-Series-FW-Update)


