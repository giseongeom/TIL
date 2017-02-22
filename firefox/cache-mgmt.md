# Firefox의 Cache 설정 팁

## DiskCache 경로 변경 

* Type `about:config` into the location bar and press enter
* Accept the warning message that appears, you will be taken to a list of preferences
* Right-click somewhere in the list and select `"New > String"`
* For the name of the preference type `browser.cache.disk.parent_directory`
* For its value type the path to where you want to store the cache
* Next locate the preference `browser.cache.disk.enable`, it must be set to true, if it is not, double-click on it to change its value 


## Enable MemoryCache only

* Cache상태를 볼려면 `about:config` 확인
* `browser.cache.disk.enable` : false
* `browser.cache.memory.enable` : true (기본값)
* `browser.cache.memory.capacity` : -1


## 참고자료

* [how do I specify or move my cache directory?](https://support.mozilla.org/en-US/questions/955978)
* [Speed Up Firefox by Moving Your Cache to RAM, No RAM Disk Required](http://lifehacker.com/5687850/speed-up-firefox-by-moving-your-cache-to-ram-no-ram-disk-required)