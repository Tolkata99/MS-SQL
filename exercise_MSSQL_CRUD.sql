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
WHERE [Salary] = 25000 OR [Salary] = 14000 OR  [Salary] = 12500 OR [Salary] = 23600

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
WHERE [ManagerID] != 4
