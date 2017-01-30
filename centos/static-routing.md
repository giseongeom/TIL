## Centos에서 Static Route 설정

### CentOS 5

* /etc/sysconfig/network-scripts/ 폴더에 route-인터페이스이름 (예: route-eth0) 파일을 생성
* 내용
```
$ more /etc/sysconfig/network-scripts/route-eth0 
172.20.0.0/22 via 10.2.0.3 dev eth0
172.30.0.0/20 via 10.2.0.3 dev eth0
```










## 참고자료

* 14.4. Configuring Static Routes
https://www.centos.org/docs/5/html/5.2/Deployment_Guide/s1-networkscripts-static-routes.html



## 기타

* 2015년 자료