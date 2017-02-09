# docker 사용자 관리


## docker 그룹에 추가

* 현재 사용자 계정을 `docker` 그룹에 추가 (Ubuntu)

```bash
sudo usermod -aG docker $USER
```

* vagrant 사용자 계정을 `docker` 그룹에 추가

```bash
sudo usermod -aG docker vagrant
```
