## Replication 설명

### Cert-based Replication

* self-signed 인증서로 진행한다. giseong-test01, giseong-test02 사용.
* `giseong-test01` 에서 작업
 * 먼저 RootCA 인증서를 생성하고, LocalMachine 저장소에 추가한다

```batch
makecert -pe -n "CN=MyTestRootCA" -ss root -sr LocalMachine -sky signature -r "MyTestRootCA.cer"
```

* Replication 서버들에 대해서 인증서 생성
```batch
makecert -pe -n "CN=FQDN" -ss my -sr LocalMachine -sky exchange -eku 1.3.6.1.5.5.7.3.1,1.3.6.1.5.5.7.3.2 -in "MyTestRootCA" -is root -ir LocalMachine -sp "Microsoft RSA SChannel Cryptographic Provider" -sy 12 01.cer
makecert -pe -n "CN=FQDN" -ss my -sr LocalMachine -sky exchange -eku 1.3.6.1.5.5.7.3.1,1.3.6.1.5.5.7.3.2 -in "MyTestRootCA" -is root -ir LocalMachine -sp "Microsoft RSA SChannel Cryptographic Provider" -sy 12 02.cer
```

* Personal 저장소에 있는 인증서들을 .pfx로 export 한다.
* giseong-test02에서 작업
 * 전 단계에서 생성된 파일들을 모두 복사해서 가져온다.
 * rootCA 인증서를 LocalMachine 저장소에 추가한다

```
certutil -addstore -f Root "MyTestRootCA.cer"
```

* .pfx 인증서들을 모두 import 한다. (Computer Account의 Personal 경로)
* giseong-test01/02 모두 공통
  * Replication에 사용된 인증서들의 RevocationCheck 안하도록 레지스트리 수정
  * Self-signed 인증서들은 RevocationCheck 못함

```batch
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Replication" /v DisableCertRevocationCheck /d 1 /t REG_DWORD /f
```

* VM 생성
```powershell
# Create VM
0..2 | ForEach-Object { NEW-VM -Name "LAB-Computer-$_" -MemoryStartupBytes 1GB -VHDPath D:\vm\VHDs\Computer-s$_.vhdx -SwitchName "vNAT" -Generation 2 -Verbose }

# Enable Dynamic Memory & start-up
GET-VM -Name LAB* | SET-VM -DynamicMemory -MemoryMinimumBytes 1GB -Passthru | Start-vm -Verbose
```


## 기타

* 2014년 자료