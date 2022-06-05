
--1
CREATE PROCEDURE usp_GetEmployeesSalaryAbove35000
AS
BEGIN
    SELECT [FirstName],
	       [LastName]
	  FROM [Employees]
     WHERE [Salary] > 35000
END


EXEC usp_GetEmployeesSalaryAbove35000

--2
CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber @number DECIMAL(18,2)
AS
BEGIN
      SELECT [FirstName],
	       [LastName]
	  FROM [Employees]
     WHERE [Salary] >= @number
END

EXEC usp_GetEmployeesSalaryAboveNumber	48000

--3
CREATE PROCEDURE usp_GetTownsStartingWith @letterWithStartTown NVARCHAR(50)
AS
BEGIN 
    DECLARE @count INT = LEN(@letterWithStartTown)
    SELECT [Name] FROM [Towns]
	WHERE LEFT([Name],@count) = @letterWithStartTown
END

EXEC usp_GetTownsStartingWith 'B'

--4
CREATE PROC usp_GetEmployeesFromTown @townName NVARCHAR(50)
AS
BEGIN
    SELECT [FirstName],
	       [LastName]
	  FROM [Employees] AS e
	  JOIN [Addresses] AS a ON a.[AddressID] = e.[AddressID]
	  JOIN [Towns] AS t ON t.[TownID] = a.[TownID]
	  WHERE t.[Name] = @townName
END

exec usp_GetEmployeesFromTown 'Sofia'

--5
CREATE FUNCTION ufn_GetSalaryLevel( @salary DECIMAL(18,4))
RETURNS VARCHAR(10)
AS
BEGIN
     DECLARE @result VARCHAR(10) 
	        IF(@Salary < 30000)
			   SET @result = 'Low'
            ELSE IF(@salary BETWEEN 30000 AND 50000)
               SET @result = 'Average'
            ELSE
			   SET @result = 'High'
     RETURN @result
END


  --6
  CREATE PROC usp_EmployeesBySalaryLevel @parameter VARCHAR(10)
  AS
  BEGIN
        SELECT [FirstName], 
               [LastName]
          FROM [Employees]
		 WHERE dbo.ufn_GetSalaryLevel([Salary]) = @parameter
  END

  EXEC usp_EmployeesBySalaryLevel 'HIGH'
  
  --7
  CREATE FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(50), @word NVARCHAR(50)) 
  RETURNS BIT
  AS
  BEGIN
       DECLARE @currentIndex INT = 1

	   WHILE(@currentIndex <= LEN(@word))
	   BEGIN
	          DECLARE @CurrentLetter VARCHAR(1) = SUBSTRING(@word, @currentIndex,1)

			  IF(CHARINDEX(@CurrentLetter,@setOfLetters) = 0)
			  BEGIN
			  RETURN 0
			  END
			     
              

			  SET @currentIndex += 1			  
	   END
     RETURN 1
  END


