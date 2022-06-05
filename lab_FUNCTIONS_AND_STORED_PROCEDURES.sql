-- Scalar Function
CREATE FUNCTION udf_ProjectDurationWeek (@StartDate DATETIME2,@EndDate DATETIME2)
RETURNS INT
AS
BEGIN 
    DECLARE @projectWeeks INT
	IF(@EndDate IS NULL)
	BEGIN
	    SET @EndDate = GETDATE()
    END
	SET @projectWeeks = DATEDIFF(WEEK,@StartDate,@EndDate)
	RETURN @projectWeeks
END

--Table-Valued Function
CREATE FUNCTION udf_AverageSalaryByDepartment()
RETURNS TABLE AS
RETURN
(
    SELECT d.[Name] AS [Department], AVG(e.[Salary] AS [AverageSalary]
	  FROM [Departments] AS d
	  JOIN [Employees] AS e ON d.[DepartmentID] = e.[DepartmentID]
	  GROUP BY d.[DepartmentID],d.[Name]
)

--Stored Procedure
CREATE PROCEDURE usp_Eployeesprojects
AS
SELECT [FirstName]
  FROM [Employees] AS e
  JOIN [EmployeesProjects] AS ep ON e.[EmployeeID] = ep.[EmployeeID]
  JOIN [Projects] AS p ON ep.[ProjectID] = p.[ProjectID]


--EXEC usp_Eployeesprojects

CREATE PROC usp_AddNumbers(@num INT,@num2 INT, @res INT OUTPUT)
AS
SET @res = @num + @num2

DECLARE @result INT
EXEC usp_AddNumbers 100, 500, @result