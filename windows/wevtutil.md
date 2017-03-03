# wevtutil Example

## Query

* `System` Log에서 10개의 오래된(Ascending) Event 검색해서 표시. text 포맷
```text
wevtutil qe system /c:10 /f:text

Event[0]:
  Log Name: System
  Source: EventLog
  Date: 2016-12-22T05:29:02.512
  Event ID: 6009
  Task: N/A
  Level: Information
  Opcode: N/A
  Keyword: Classic
  User: N/A
  User Name: N/A
  Computer: WIN-UFKT7P1ELHE
  Description:
Microsoft (R) Windows (R) 10.00. 14393  Multiprocessor Free.
```

* `System` Log에서 최근 `1일(86400초)`에서 Error 유형의 이벤트중 10개 표시
```
wevtutil qe system /c:10 /f:text /q:*"[System[(Level=2) and TimeCreated[timediff(@SystemTime)<=86400000]]]"

Event[0]:
  Log Name: System
  Source: Microsoft-Windows-DistributedCOM
  Date: 2017-03-02T21:21:08.135
  Event ID: 10016
  Task: N/A
  Level: Error
  Opcode: Info
  Keyword: Classic
  User: S-1-5-18
  User Name: NT AUTHORITY\SYSTEM
  Computer: GISEONG-PC
  Description:
The application-specific permission sewith CLSID  ... 생략 ... 
```

* 최근 `1일(86400초)` 이벤트에서 4634, 4624 Event를 찾아서 10개 표시
```
wevtutil qe system /c:10 /f:text /q:*"[System[(EventID=4634 and 4624) and TimeCreated[timediff(@SystemTime)<=86400000]]]"

Event[0]:
  Log Name: System
  Source: EventLog
  Date: 2016-12-22T05:29:02.512
  Event ID: 6009
  Task: N/A
  Level: Information
  Opcode: N/A
  Keyword: Classic
  User: N/A
  User Name: N/A
  Computer: WIN-UFKT7P1ELHE
  Description:
Microsoft (R) Windows (R) 10.00. 14393  Multiprocessor Free.
```


