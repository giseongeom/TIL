# openssl tip

## Certificate Management

### Export/Import

* .pfx (pkcs12) -> cert 추출
```bash
openssl pkcs12 -in example.com.pfx -nokeys -out example.com.crt -nodes
```

*  .pfx (pkcs12) ->  Private Key 추출
```bash
openssl pkcs12 -in example.com.pfx -out example.com.key -nocerts
```

### Private Key

* Private Key 에서 Passphrase 제거 (웹서버용)
```bash
openssl rsa -in example.com.key -out example.com.nopass.key
```

## 참고자료

* [OpenSSL Command-Line HOWTO](https://www.madboa.com/geek/openssl/)


## 기타

* 2015년 자료