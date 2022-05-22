USE [SoftUni]

--1
SELECT TOP(5)
       e.[EmployeeID]
      ,e.[JobTitle] 
      ,a.[AddressID]
      ,a.[AddressText] 
 FROM      [Employees] AS e
 LEFT JOIN [Addresses] AS a 
ON e.AddressID = a.AddressID
  ORDER BY a.[AddressID]

--2
 SELECT TOP (50)
         e.[FirstName]
		,e.[LastName]
		,t.[Name]
		,a.[AddressText]
   FROM       [Employees] AS e
 LEFT JOIN [Addresses] AS a ON e.[AddressID] = a.[AddressID]
 LEFT JOIN     [Towns] AS t ON t.[TownID] = a.[TownID]
ORDER BY e.[FirstName],e.[LastName]

--3
SELECT 
      e.[EmployeeID]
	  ,e.[FirstName]
	  ,e.[LastName]
	  ,d.[Name] AS [DepartmentName]
     FROM   [Employees] AS e 
LEFT JOIN [Departments] AS d ON e.[DepartmentID] = d.[DepartmentID]
WHERE d.[Name] = 'Sales'
ORDER BY e.[EmployeeID]

--4
SELECT TOP (5)
      e.[EmployeeID]
	  ,e.[FirstName]
	  ,e.[Salary]
	  ,d.[Name] AS [DepartmentName]
     FROM   [Employees] AS e 
INNER JOIN [Departments] AS d ON e.[DepartmentID] = d.[DepartmentID]
WHERE e.[Salary] > 15000
ORDER BY d.[DepartmentID] ASC

--5
   SELECT TOP (3)
           e.[EmployeeID]
          ,e.[FirstName]
     FROM          [Employees] AS e
LEFT JOIN [EmployeesProjects] AS ep ON e.[EmployeeID] = ep.[EmployeeID]
WHERE ep.[ProjectID] IS  NULL
ORDER BY E.[EmployeeID] 

--6
SELECT 
       e.[FirstName]
	  ,e.[LastName]
	  ,e.[HireDate]
	  ,d.[Name] AS [DeptName]
FROM [Employees] AS e
LEFT JOIN [Departments] AS d ON e.[DepartmentID] = d.[DepartmentID]
WHERE d.Name IN('Sales','Finance') AND e.[HireDate] > '1.1.1999' 
ORDER BY e.[HireDate]

--7
	SELECT TOP (5)
			e.[EmployeeID]
			,e.[FirstName]
			,p.[Name]
	FROM [Employees] AS e
	INNER JOIN [EmployeesProjects] AS ep ON e.[EmployeeID] = ep.[EmployeeID]
	INNER JOIN          [Projects] AS p ON ep.[ProjectID] = p.[ProjectID]
	WHERE p.[StartDate] > '8.13.2002' AND p.[EndDate] IS NULL
	ORDER BY e.[EmployeeID]
