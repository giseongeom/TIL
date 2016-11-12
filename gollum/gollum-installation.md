## Windows 에서 gollum 설치 및 실행
* ruby 모르는 바보도 할 수 있음.

### jruby 설치
* <http://jruby.org/download> 에서 .zip 포맷의 파일 다운로드 (예: ``jruby-bin-9.1.6.0.zip``)
* 적당한 폴더에 압축해제한다. (예: C:\devtools\jruby)
* JAVA
  * JDK는 미리 설치되어 있고, ``JAVA_HOME`` 환경변수를 설정한다.
  * ``%JAVA_HOME%\bin`` 경로를 ``%PATH%``에 등록한다.

### gollum gem 설치
* jruby에 포함된 gem 명령으로 gollum 설치한다.
```text
giseong.eom@GISEONG-HOME C:\devtools\jruby\bin
> gem install gollum

Fetching: mime-types-1.25.1.gem (100%)
Successfully installed mime-types-1.25.1
Fetching: rjgit-4.5.0.0.gem (100%)
Successfully installed rjgit-4.5.0.0
Fetching: gollum-rjgit_adapter-0.3.3-java.gem (100%)
Successfully installed gollum-rjgit_adapter-0.3.3-java
Fetching: rouge-2.0.6.gem (100%)
Successfully installed rouge-2.0.6
Fetching: nokogiri-1.6.8.1-java.gem (100%)
Successfully installed nokogiri-1.6.8.1-java
Fetching: stringex-2.5.2.gem (100%)
Successfully installed stringex-2.5.2
Fetching: sanitize-2.1.0.gem (100%)
Successfully installed sanitize-2.1.0
Fetching: github-markup-1.4.0.gem (100%)
Successfully installed github-markup-1.4.0
Fetching: gollum-lib-4.2.1-java.gem (100%)
Successfully installed gollum-lib-4.2.1-java
Fetching: kramdown-1.8.0.gem (100%)
Successfully installed kramdown-1.8.0
Fetching: rack-1.6.5.gem (100%)
Successfully installed rack-1.6.5
Fetching: tilt-2.0.5.gem (100%)
Successfully installed tilt-2.0.5
Fetching: rack-protection-1.5.3.gem (100%)
Successfully installed rack-protection-1.5.3
Fetching: sinatra-1.4.7.gem (100%)
Successfully installed sinatra-1.4.7
Fetching: mustache-0.99.8.gem (100%)
Successfully installed mustache-0.99.8
Fetching: useragent-0.14.0.gem (100%)
Successfully installed useragent-0.14.0
Fetching: gollum-4.0.1.gem (100%)
Successfully installed gollum-4.0.1
17 gems installed
```

### gollum 실행

* Wiki로 사용할 git 저장소 경로가 ``%USERPROFILE%\Documents\Github\TIL`` 이라고 가정.
* gollum 실행
```
C:\devtools\jruby\bin\gollum %USERPROFILE%\Documents\Github\TIL
```
* IE, Chrome 등의 브라우져로 <http://localhost:4567> 접근해보자. 
* <http://localhost:4567/Home> 첫 페이지 편집 페이지가 표시되면 성공!
* gollum 실행 로그
```text
giseong.eom@GISEONG-HOME C:\devtools\jruby\bin
> gollum %USERPROFILE%\Documents\Github\TIL

[2016-11-11 23:30:30] INFO  WEBrick 1.3.1
[2016-11-11 23:30:30] INFO  ruby 2.3.1 (2016-11-09) [java]
== Sinatra (v1.4.7) has taken the stage on 4567 for development with backup from WEBrick
[2016-11-11 23:30:30] INFO  WEBrick::HTTPServer#start: pid=9040 port=4567
0:0:0:0:0:0:0:1 - - [11/Nov/2016:23:30:53 KST] "GET / HTTP/1.1" 302 0 - -> /
0:0:0:0:0:0:0:1 - - [11/Nov/2016:23:30:54 KST] "GET /Home HTTP/1.1" 200 3553 - -> /Home

(생략)
```

## 참고자료

* <https://github.com/gollum/gollum>
* <http://jruby.org>