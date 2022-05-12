USE SoftUni

--2
SELECT * FROM [dbo].[Departments]

--3
SELECT [Name] FROM [dbo].[Departments]

--4
SELECT [FirstName],[LastName],[Salary] FROM [dbo].[Employees]

--5
SELECT [FirstName],[MiddleName],[LastName] FROM [dbo].[Employees]

--6
SELECT CONCAT([FirstName], '.', [LastName], '@softuni.bg') 
AS [Full Email Address]
FROM [dbo].[Employees]

--7
SELECT DISTINCT [Salary] FROM [dbo].[Employees] 

--8
SELECT * FROM [dbo].[Employees] WHERE [JobTitle] = 'Sales Representative'

--9
SELECT [FirstName],[LastName],[JobTitle] 
FROM [dbo].[Employees] 
WHERE [Salary] BETWEEN 20000 AND 30000

--10
SELECT CONCAT([FirstName],' ',[MiddleName],' ',[LastName])
AS [Full Name]
FROM [dbo].[Employees]
WHERE [Salary] IN (25000,14000,12500,23600)

--11
SELECT [FirstName],[LastName] 
FROM [Employees] 
WHERE [ManagerID] IS NULL

--12
SELECT [FirstName],[LastName],[Salary] 
FROM [Employees]
WHERE [Salary] >= 50000
ORDER BY [Salary] DESC

--13
SELECT TOP(5) [FirstName],[LastName]
FROM [Employees]
ORDER BY [SALARY] DESC

--14
SELECT [FirstName],[LastName]
FROM [Employees]
WHERE NOT [DepartmentID] = 4

--15
  SELECT * FROM [Employees]
ORDER BY [Salary] 
    DESC, [FirstName] 
     ASC, [LastName] 
    DESC, [MiddleName] 
     ASC
	 
--16 
GO
CREATE VIEW [V_EmployeesSalaries]
AS
SELECT [FirstName],[LastName],[Salary] FROM [Employees]

GO

SELECT * FROM
V_EmployeesSalaries

GO

--17
CREATE VIEW [V_EmployeeNameJobTitle]
AS
SELECT CONCAT([FirstName],' ',[MiddleName],' ',[LastName])
AS [FullName], 
[JobTitle] 
AS [Job Title]
FROM [Employees]

--18
SELECT DISTINCT [JobTitle] FROM [Employees]

--19
SELECT TOP(10) * FROM [Projects]
ORDER BY [StartDate], [Name] 

--20
SELECT TOP(7) * FROM [Employees]
ORDER BY [EmployeeID] 


--21
SELECT * FROM [Employees]
WHERE [DepartmentID] IN (1,2,4,11)

UPDATE [Employees]
SET [Salary] += [Salary] * 0.12
WHERE [DepartmentID] IN (1,2,3,11)

SELECT [Salary] FROM [Employees]

GO
--24

SELECT [CountryName],[CountryCode],[CurrencyCode],
      CASE
	   WHEN [CurrencyCode] = 'EUR' THEN 'Euro'
	   ELSE 'Not Euro'
	   END AS [Currency]
       FROM [Countries]
ORDER BY [CountryName]