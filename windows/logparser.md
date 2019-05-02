# LogParser

## Usage

### 게임 로그에서 특정 필드 값의 발생 건수를 세어보기

* 헤더용 파일: `gamelogheaders.csv`
```csv
timeStamp	planetId	serverType	logType	int1	int2	int3	int4	int5	int6	int7	int8	int9	int10	int11	int12	int13	int14	int15	int64_1	int64_2	int64_3	int64_4	int64_5	int64_6	int64_7	int64_8	int64_9	int64_10	userDbId	itemDbId	continentId	channelId	subZoneId	posX	posY	posZ	string1	string2	string3	string4	string5
```

* 사례 1
  * LogType ID는 `11200 ~ 11209`
  * LogType별 Daily 합계를 구하자


```cmd
logparser -i:TSV -iHeaderFile gamelogheader.csv -stats:Off  -rtp:-1
"SELECT TO_DATE(timestamp) AS Date, logType, COUNT(logtype) AS logtype_count FROM 2019-04-29\*.log2 WHERE logType BETWEEN 11200 AND 11209 GROUP BY logType, Date ORDER BY logtype ASC"

Date       logType logtype_count
---------- ------- -------------
2019-04-29 11200   14278
2019-04-29 11201   14157
2019-04-29 11202   15581
2019-04-29 11203   15582
2019-04-29 11204   69
2019-04-29 11205   7198
2019-04-29 11208   24430
2019-04-29 11209   320358
```


* 사례 2
  * LogType ID `11200`의 시간대별 합계를 구하자

```cmd
logparser -i:TSV -iHeaderFile gamelogheader.csv -stats:Off -rtp:-1
"SELECT TO_STRING(TO_TIME(timestamp), 'hh') AS TIME, logType, COUNT(logtype) AS logtype_count FROM 2019-04-29\*.log2 WHERE logType = 11200 GROUP BY TIME, logType ORDER BY TIME ASC"

TIME logType logtype_count
---- ------- -------------
08   11200   304
09   11200   4562
10   11200   1363
11   11200   1260
12   11200   1200
13   11200   1274
14   11200   1331
15   11200   1651
16   11200   1333
```


## 참고자료

* [Log Parser 2.2 Download](https://www.microsoft.com/en-us/download/details.aspx?id=24659)