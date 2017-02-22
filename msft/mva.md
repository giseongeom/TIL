# Microsoft MVA 사용 팁


## 자막다운로드

* MVA 사이트 로그인
`http://www.microsoftvirtualacademy.com/training-courses/getting-started-with-powershell-desired-state-configuration-dsc-`

* 동영상 Page Source 에서 `<div class="video-player">` 태그를 찾아서, src URL 확인
`http://channel9.msdn.com//Series/Getting-Started-with-PowerShell-Desired-State-Configuration-DSC/01/player?format=html5`

* src URL에서 `player?format=html5` 대신 `captions?f=webvtt&l=en` 사용해서 연결 -> subtitle 내용이 보이는지 확인
`http://channel9.msdn.com//Series/Getting-Started-with-PowerShell-Desired-State-Configuration-DSC/01/captions?f=webvtt&l=en`

* Save AS xxx.srt 로 저장한다.