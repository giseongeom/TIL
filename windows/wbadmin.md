## wbadmin

### System Image 백업

* wbadmin 예제
```
wbAdmin start backup -backupTarget:D: -include:C: -allCritical -quiet
```

* wbadmin 옵션 설명
```
-backupTarget  Specifies the storage location for this backup. Requires a
                hard disk drive letter (f:), a volume GUID-based path in the
                format of \\?\Volume{GUID}, or a Universal Naming Convention
                (UNC) path to a remote shared folder
                (\\<servername>\<sharename>\).
                By default, the backup will be saved at: \\<servername>
                \<sharename>\WindowsImageBackup\<ComputerBackedUp>\.
                Important: If you save a backup to a remote shared folder,
                that backup will be overwritten if you use the same folder to
                back up the same computer again. In addition, if the backup
                operation fails, you may finish with no backup because the
                older backup will be overwritten, but the newer backup will
                not be usable.
                You can avoid this by creating subfolders in the remote shared
                folder to organize your backups. If you do this, the
                subfolders will need twice the space of the parent folder.

-include       Specifies the comma-delimited list of items to include in the
                backup. You can include multiple volumes. Volume paths can be
                specified using volume drive letters, volume mount points, or
                GUID-based volume names. If you use a GUID-based volume
                name, it should be terminated with a backslash (\). You can
                use the wildcard character (*) in the file name when
                specifying a path to a file. Should be used only when the
                -backupTarget parameter is used.

-allCritical   Creates a backup that includes all critical volumes (critical
                volumes contain the operating system files and components) in
                addition to any other items that you specified with the
                -include parameter. This parameter is useful if you are
                creating a backup for bare metal recovery or system state
                recovery. Should be used only when the -backupTarget
                parameter is used.

-quiet         Runs the command with no prompts to the user.
```

* 실행결과
```
... 중간 생략 ...

Creating a backup of volume System(C:), copied (99%).
The backup of volume System(C:) completed successfully.
Creating a backup of volume Recovery (300.00 MB), copied (99%).
The backup of volume Recovery (300.00 MB) completed successfully.
Summary of the backup operation:
------------------

The backup operation successfully completed.
The backup of volume (EFI System Partition) (99.00 MB) completed successfully.
The backup of volume System(C:) completed successfully.
The backup of volume Recovery (300.00 MB) completed successfully.
Log of files successfully backed up:
C:\Windows\Logs\WindowsBackup\Backup-12-04-2014_07-15-23.log
```


## 참고자료

* [How to Create and Restore System Image Backups on Windows 8.1](http://www.howtogeek.com/167984/how-to-create-and-restore-system-image-backups-on-windows-8.1/)

## 기타

* 2014년 자료