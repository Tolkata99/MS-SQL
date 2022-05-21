
USE [SoftUni]

--1
     SELECT [FirstName],[LastName] 
       FROM [Employees]
      WHERE LEFT([FirstName],2) = 'Sa'

	 SELECT [FirstName],[LastName] 
       FROM [Employees]
      WHERE SUBSTRING([FirstName],1,2) = 'Sa'

--2
     SELECT [FirstName],[LastName]
       FROM [Employees]
	  WHERE  CONTAINS([LastName],'Ei')

     SELECT [FirstName],[LastName]
       FROM [Employees]
	  WHERE  CHARINDEX('ei',LastName) <> 0

	 SELECT [FirstName],[LastName] 
	   FROM Employees
	  WHERE [LastName] LIKE '%ei' OR [LastName] LIKE '%ei%' OR [LastName] LIKE 'ei%'

--3
     SELECT [FirstName] 
	   FROM Employees
      WHERE [DepartmentID] IN(3,10) AND 
   DATEPART(YEAR,HireDate) BETWEEN 1995 AND 2005

--4
    SELECT [FirstName], [LastName] 
	  FROM [Employees]
	 WHERE [JobTitle] NOT LIKE '%engineer%'

--5
     SELECT [Name] 
	   FROM [Towns] 
	  WHERE LEN([Name]) IN(5,6)
   ORDER BY [Name]
	 
--6

    SELECT [TownID], [Name] 
	  FROM [Towns]
	 WHERE LEFT([Name],1) IN ('M', 'K', 'B', 'E')
  ORDER BY [Name]

  --,

  SELECT [TownID],[Name] 
	  FROM [Towns]
	 WHERE [Name] LIKE '[MKBE]%'
  ORDER BY [Name]

  --7

  SELECT [TownID],[Name] 
	  FROM [Towns]
	 WHERE [Name] NOT LIKE '[RBD]%'
  ORDER BY [Name]

  --8
  CREATE VIEW [V_EmployeesHiredAfter2000] AS
  SELECT [FirstName],[LastName]
    FROM [Employees]
   WHERE DATEPART(YEAR,[HireDate]) > 2000

   SELECT * FROM [V_EmployeesHiredAfter2000]
   
   --9

   SELECT [FirstName],[LastName] 
     FROM [Employees]
    WHERE LEN([LastName]) = 5

  --10
       SELECT [EmployeeID],[FirstName],[LastName],[Salary],
              DENSE_RANK() OVER(PARTITION BY [Salary] ORDER BY [EmployeeID]) AS [Rank]
         FROM [Employees]
        WHERE [Salary] BETWEEN 10000 AND 50000
	 ORDER BY [Salary] DESC

--11
SELECT * FROM
  (SELECT [EmployeeID],[FirstName],[LastName],[Salary],
              DENSE_RANK() OVER(PARTITION BY [Salary] ORDER BY [EmployeeID]) AS [Rank]
         FROM [Employees]
        WHERE ([Salary] BETWEEN 10000 AND 50000)  
	 ) 
	 AS [RankingTable] 
	 WHERE [Rank] = 2 
  ORDER BY [Salary] DESC

  --12
  USE [Geography]

  SELECT [CountryName] AS [Country Name],
         [IsoCode]     AS [ISO Code] 
    FROM [Countries]	
   WHERE [CountryName] LIKE '%A%A%A%'
ORDER BY [ISO Code]


--13
  SELECT [PeakName],[RiverName],LOWER(CONCAT([PeakName], SUBSTRING([RiverName],2,LEN(RiverName)))) 
                AS [Mix]
    FROM [Peaks]  AS p,
         [Rivers] AS r
   WHERE RIGHT(p.[PeakName],1) = LEFT(r.[RiverName],1)
ORDER BY [Mix]

USE [Diablo]

SELECT [Name], DATEPART(YEAR,MONTH,DAY,[Start]) FROM [Games]

