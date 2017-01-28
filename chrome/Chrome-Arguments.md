## Arguments

* DiskCache 
```
--disk-cache-dir=T:\ChromeCache
```
* Disable tracking
```
 --incognito
```
* ProxyServer 설정
```
--proxy-server="https://warning.or.kr:8988"
```
    * Chrome은 https proxy (예: Squid)도 지원

### Crash 대응

* 최초 실행할 때 Chrome이 hang 상태에 빠지는 경우 있음. 이때 **``--no-sandbox``** 옵션 사용하면 정상화될 수 있음
```
--no-sandbox
```
* **``--no-sandbox``** 옵션을 사용하면 다음과 같은 경고 문구가 표시됨
```
You are using an unsupported command-line flag: --no-sandbox. Stability and security will suffer
```
    * 경고 문구까지 감추려면 ``--test-type`` 옵션 사용하면 된다.
    * 최종적으로는 다음과 같이 사용하면 됨
    ```
    --no-sandbox --test-type
    ```



## 참고자료

* [List of Chromium Command Line Switches](http://peter.sh/experiments/chromium-command-line-switches/)