
# ls output

* LTS 버전에 따른 ls 명령의 output format 변경

## LTS 10.04

```
sysadmin@DEV-SGenv-06:~$ ls -la
total 44
drwxr-xr-x 4 sysadmin sysadmin 4096 2014-07-27 12:36 .
drwxr-xr-x 5 root     root     4096 2012-09-10 16:05 ..
-rw------- 1 sysadmin sysadmin 3789 2014-07-28 16:48 .bash_history
-rw-r--r-- 1 sysadmin sysadmin  220 2012-08-23 11:17 .bash_logout
-rw-r--r-- 1 sysadmin sysadmin 3105 2012-08-23 15:16 .bashrc
drwx------ 2 sysadmin sysadmin 4096 2012-08-23 11:18 .cache
-rw-r--r-- 1 sysadmin sysadmin  675 2012-08-23 11:17 .profile
drwx------ 2 sysadmin sysadmin 4096 2012-12-07 11:24 .ssh
-rw-r--r-- 1 sysadmin sysadmin    0 2012-08-23 11:18 .sudo_as_admin_successful
-rw------- 1 root     root     4374 2012-09-06 19:50 .viminfo
-rw------- 1 sysadmin sysadmin   58 2014-07-27 12:36 .Xauthority
```

## LTS 12.04

* LTS 12.04부터 ls 명령의 기본 출력이 변경됨
```
sysadmin@DEV-SGenv-07:~$ ls -la
total 76
drwxr-xr-x 5 sysadmin admin  4096 Jul 27 12:49 .
drwxr-xr-x 5 root     root   4096 Dec 31  2012 ..
-rw------- 1 sysadmin admin 10531 Jul 28 17:09 .bash_history
-rw-r--r-- 1 sysadmin admin   220 Dec 28  2012 .bash_logout
-rw-r--r-- 1 sysadmin admin  3486 Dec 28  2012 .bashrc
drwx------ 2 sysadmin admin  4096 Dec 28  2012 .cache
-rw-r--r-- 1 sysadmin admin 14204 Jun 22 09:13 history.txt
-rw------- 1 sysadmin admin    49 Jun 17  2013 .lesshst
-rw-r--r-- 1 sysadmin admin   675 Dec 28  2012 .profile
drwx------ 2 sysadmin admin  4096 May  6  2013 .ssh
drwxr-xr-x 3 sysadmin admin  4096 Jan  6  2014 .subversion
-rw-r--r-- 1 sysadmin admin     0 Dec 28  2012 .sudo_as_admin_successful
-rw------- 1 sysadmin admin  6324 Jul 27 12:49 .viminfo
-rw------- 1 sysadmin admin    58 Jun 22 09:09 .Xauthority
```

* 10.04 시절과 동일한 출력 포맷을 위해서는 `--time-style=long-iso` 옵션이 필요.
```
sysadmin@DEV-SGenv-07:~$ ls -la --time-style=long-iso
total 76
drwxr-xr-x 5 sysadmin admin  4096 2014-07-27 12:49 .
drwxr-xr-x 5 root     root   4096 2012-12-31 10:01 ..
-rw------- 1 sysadmin admin 10531 2014-07-28 17:09 .bash_history
-rw-r--r-- 1 sysadmin admin   220 2012-12-28 17:51 .bash_logout
-rw-r--r-- 1 sysadmin admin  3486 2012-12-28 17:51 .bashrc
drwx------ 2 sysadmin admin  4096 2012-12-28 17:52 .cache
-rw-r--r-- 1 sysadmin admin 14204 2014-06-22 09:13 history.txt
-rw------- 1 sysadmin admin    49 2013-06-17 22:33 .lesshst
-rw-r--r-- 1 sysadmin admin   675 2012-12-28 17:51 .profile
drwx------ 2 sysadmin admin  4096 2013-05-06 13:51 .ssh
drwxr-xr-x 3 sysadmin admin  4096 2014-01-06 15:18 .subversion
-rw-r--r-- 1 sysadmin admin     0 2012-12-28 19:07 .sudo_as_admin_successful
-rw------- 1 sysadmin admin  6324 2014-07-27 12:49 .viminfo
-rw------- 1 sysadmin admin    58 2014-06-22 09:09 .Xauthority
```
