# 기초적인 DB 조작

## Attach

* DB attach
```sql
CREATE DATABASE AdventureWorks2008 ON 
	(FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\AdventureWorks2008_Data.mdf'),
	(FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\AdventureWorks2008_Log.ldf') FOR ATTACH;
```