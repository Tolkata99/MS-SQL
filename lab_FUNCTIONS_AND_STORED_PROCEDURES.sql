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