# Diskpart Example

## Volume Shrink/Extend

* shrink
```
DISKPART> list volume
  Volume ###  Ltr  Label        Fs     Type        Size     Status     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     E                       DVD-ROM         0 B  No Media
* Volume 1     C                NTFS   Partition   7450 GB  Healthy    Boot
  Volume 2         Recovery     NTFS   Partition    300 MB  Healthy    Hidden
  Volume 3                      FAT32  Partition     99 MB  Healthy    System

DISKPART> shrink querymax
The maximum number of reclaimable bytes is: 7431 GB (7609972 MB)

DISKPART> shrink desired=7009972
DiskPart successfully shrunk the volume by: 6845 GB

DISKPART> list volume

  Volume ###  Ltr  Label        Fs     Type        Size     Status     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     E                       DVD-ROM         0 B  No Media
* Volume 1     C                NTFS   Partition    604 GB  Healthy    Boot
  Volume 2         Recovery     NTFS   Partition    300 MB  Healthy    Hidden
  Volume 3                      FAT32  Partition     99 MB  Healthy    System
```

## Change Drive letter

* Remove drive letter
```
DISKPART> list volume
  Volume ###  Ltr  Label        Fs     Type        Size     Status     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     E                       DVD-ROM         0 B  No Media
* Volume 1     C                NTFS   Partition    604 GB  Healthy    Boot
  Volume 2         Recovery     NTFS   Partition    300 MB  Healthy    Hidden
  Volume 3                      FAT32  Partition     99 MB  Healthy    System

DISKPART> select volume 0
Volume 0 is the selected volume.

DISKPART> remove
DiskPart successfully removed the drive letter or mount point.

DISKPART> list volume
  Volume ###  Ltr  Label        Fs     Type        Size     Status     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
* Volume 0                             DVD-ROM         0 B  No Media
  Volume 1     C                NTFS   Partition    604 GB  Healthy    Boot
  Volume 2         Recovery     NTFS   Partition    300 MB  Healthy    Hidden
  Volume 3                      FAT32  Partition     99 MB  Healthy    System

DISKPART> ASSIGN LETTER=Z
DiskPart successfully assigned the drive letter or mount point.

DISKPART> list volume
  Volume ###  Ltr  Label        Fs     Type        Size     Status     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
* Volume 0     Z                       DVD-ROM         0 B  No Media
  Volume 1     C                NTFS   Partition    604 GB  Healthy    Boot
  Volume 2         Recovery     NTFS   Partition    300 MB  Healthy    Hidden
  Volume 3                      FAT32  Partition     99 MB  Healthy    System
```


## eject USB External drive

* `select volume XX`
* `remove all dismount`


## 참고자료

* [Remove USB device from command line](http://superuser.com/questions/443162/remove-usb-device-from-command-line)