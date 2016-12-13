## docker-engine 서비스의 systemd 설정

### ``TCP/2375`` 리스닝하도록 설정하기

* 변경 전
```text
opsadmin@dockerhost:~$ sudo systemctl status docker.service
● docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2016-12-13 21:56:58 KST; 4s ago
     Docs: https://docs.docker.com
 Main PID: 1944 (dockerd)
    Tasks: 17
   Memory: 13.1M
      CPU: 289ms
   CGroup: /system.slice/docker.service
           ├─1944 /usr/bin/dockerd -H fd://
           └─1951 docker-containerd -l unix:///var/run/docker/libcontainerd/docker-containerd.sock --shim docker-containerd-shim --metrics-interval=0

opsadmin@dockerhost:~$ netstat -an|grep -i 2375
opsadmin@dockerhost:~$
```

* docker.service의 systemd 기본값 override 하도록 설정
  * ``/etc/systemd/system/docker.service.d`` 폴더 생성
  * 아래 내용을 /etc/systemd/system/docker.service.d/override.conf 파일에 저장
```
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H fd://
```
* systemctl 명령을 이용해서 docker를 restart 한다.
```text
opsadmin@dockerhost:~$ sudo systemctl daemon-reload
opsadmin@dockerhost:~$ sudo systemctl restart docker
```

* 변경 후
```text
opsadmin@dockerhost:~$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
  Drop-In: /etc/systemd/system/docker.service.d
           └─override.conf
   Active: active (running) since Tue 2016-12-13 22:12:36 KST; 42s ago
     Docs: https://docs.docker.com
 Main PID: 2489 (dockerd)
    Tasks: 18
   Memory: 15.8M
      CPU: 343ms
   CGroup: /system.slice/docker.service
           ├─2489 /usr/bin/dockerd -H tcp://0.0.0.0:2375 -H fd://
           └─2497 docker-containerd -l unix:///var/run/docker/libcontainerd/docker-containerd.sock --shim docker-containerd-shim --metrics-interval=0

opsadmin@dockerhost:~$ netstat -an|grep -i 2375
tcp6       0      0 :::2375                 :::*                    LISTEN
```