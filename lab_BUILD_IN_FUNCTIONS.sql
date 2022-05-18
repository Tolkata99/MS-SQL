

--String Functions
SELECT TOP (20) 
       CONCAT_WS('  &    ',[Name],[Start]) 
	   AS NameAndStart
       FROM [Diablo].[dbo].[Games]


SELECT SUBSTRING(Name,2,5) 
       AS SubstringedSTR 
	   FROM Items 

SELECT SUBSTRING ('SofrUni',5,3) 
       AS NiceSchool


USE SoftUni

SELECT [Name],[Description],
CONCAT(' ',SUBSTRING([Description],50,50), '...') AS Summary
FROM Projects

SELECT REPLACE('SoftUni','Soft','hard') AS BetterSchool

SELECT FirstName, 
       REPLACE(FirstName,'Jo','$**************') 
	   FROM Employees

SELECT LTRIM('   sOFTuNI   ')
 
SELECT RTRIM('   sOFTuNI   SDFSDF     ')

SELECT TRIM('   sOFTuNI   SDFSDF     ')

SELECT LEN(FirstName) FROM Employees

SELECT DATALENGTH(FirstName) FROM Employees

SELECT FirstName, LEFT(FirstName,3) FROM Employees

SELECT FirstName, RIGHT(FirstName,3) FROM Employees

SELECT LastName,LOWER(LastName) from Employees

SELECT LastName,UPPER(LastName) from Employees

SELECT LastName,REVERSE(LastName) from Employees

CREATE VIEW V_ReplicateLastName 
       AS SELECT LastName 
       FROM Employees

SELECT LastName,STUFF(LastName,3,3,'sof')
                 FROM Employees

--Math Functions

SELECT Id,(A * 1.0 * H)/2 AS Area FROM Trinagles

SELECT PI()

SELECT ABS(-PI())

SELECT ABS(-100)

SELECT SQUARE(50)

SELECT POWER(50,2)

SELECT FLOOR(3.4)

SELECT FLOOR(3.6)

SELECT CEILING(6.499)

SELECT CAST(5 AS FLOAT)

SELECT SIGN(55)

SELECT SIGN(0)

SELECT SIGN(-7)

SELECT RAND()

--Date functions

SELECT DATEPART(YEAR,'2017-05-05') AS DatePartYear

SELECT DATEPART(QUARTER,'2018-05-09') AS DatePartQuarter

SELECT DATEPART(MONTH,'2016-01-02') AS DatePartMonth

SELECT DATEPART(DAY,'2017-05-05') AS DatePartDay

SELECT DATEDIFF(DAY,'2017-06-06','2017-06-08')

SELECT DATEDIFF(YEAR,'2010-06-06','2017-06-08')

SELECT DATEDIFF(MONTH,'2014-06-06','2017-06-08')

SELECT DATENAME(WEEKDAY,'2014-06-06')

SELECT DATEADD(YEAR,1,'2014-06-06')

SELECT GETDATE()

SELECT EOMONTH('2014-06-06',2)

SELECT DATENAME(WEEKDAY,EOMONTH('2014-06-06',1))

--Other functions

SELECT CAST('15' AS DECIMAL)

SELECT CONVERT(DECIMAL,'55')

SELECT ISNULL(NULL,'The value is null, please introduse other value')



