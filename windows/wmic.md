# wmic usage

## 사용자 관리

### Password Expire

* Local user (예: vagrant) 계정의 암호 만료를 막으려면?
```
WMIC USERACCOUNT WHERE "Name='vagrant'" SET PasswordExpires=FALSE
```



## 참고자료

* [How to set password NEVER EXPIRES to an user account trough NET USER cmd](http://www.tomshardware.com/forum/251587-45-password-expires-user-account-trough-user)