
--USE books;
--SELECT SCHEMA_NAME(schema_id),* FROM books.sys.tables;
--SELECT type_name(system_type_id),* FROM books.sys.columns WHERE object_id = OBJECT_ID('authors');
--SELECT * FROM INFORMATION_SCHEMA.TABLES  WHERE TABLE_NAME = 'authors';
--SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'authors';

--EXEC sys.sp_help @objname='authors'

--EXEC sys.sp_columns @table_name = 'authors'
EXEC sys.sp_helpconstraint @objname = 'authors'

USE books;
CREATE table t3(
	id int,
	dat datetime default(current_timestamp)--ms sql default
);
--over = get all result in ease query
SELECT TOP 1000 [id]
      ,[dat]
      --,dateadd(month,DATEDIFF(month,'19991231',dat),'19991231')
      ,ROW_NUMBER() over( PARTITION BY id order by id )--get id on current row not all result
  FROM [books].[dbo].[t3] 
--get max coutn from table
SELECT top 1  o2.custid FROM [TSQLFundamentals2008].[Sales].[Orders] o2 GROUP BY o2.custid ORDER BY COUNT(o2.custid) DESC

SELECT  [orderyear]
      ,[qty]
      ,( SELECT SUM(o1.qty) FROM [TSQLFundamentals2008].[Sales].[OrderTotalsByYear] o1 WHERE o1.orderyear <= o2.[orderyear]  )
FROM [TSQLFundamentals2008].[Sales].[OrderTotalsByYear] o2 ORDER BY [orderyear]

SELECT [custid]
  ,[region]
  ,case WHEN region IS null THEN 2 else 1 end
FROM [TSQLFundamentals2008].[Sales].[Customers]
ORDER BY case  WHEN region IS null THEN 2 ELSE 1 END
--order query


grant(dcl)

CREATE USER 'mega'@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'mega'@localhost;