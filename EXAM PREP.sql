CREATE DATABASE TripService

USE TripService

CREATE TABLE Cities(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20) NOT NULL,
CountryCode NVARCHAR(2) NOT NULL
)

CREATE TABLE Hotels(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(30) NOT NULL,
CityId INT REFERENCES Cities(Id) NOT NULL,
EmployeeCount INT NOT NULL,
BaseRate DECIMAL(15,2)
)

CREATE TABLE Rooms(
Id INT PRIMARY KEY IDENTITY,
Price DECIMAL(15,2) NOT NULL,
[Type] NVARCHAR(20) NOT NULL,
Beds INT NOT NULL,
HotelId INT REFERENCES Hotels(Id) NOT NULL
)

CREATE TABLE Trips(
Id INT PRIMARY KEY IDENTITY,
RoomId INT REFERENCES Rooms(Id) NOT NULL,
BookDate DATETIME2 NOT NULL,
CHECK(BookDate < ArrivalDate),
ArrivalDate DATETIME2 NOT NULL,
CHECK(ArrivalDate < ReturnDate),
ReturnDate DATETIME2 NOT NULL,
CancelDate DATETIME2
)

CREATE TABLE Accounts(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(50) NOT NULL,
MiddleName NVARCHAR(20),
LastName NVARCHAR(50) NOT NULL,
CityId INT REFERENCES Cities(Id),
BirthDate DATETIME2 NOT NULL,
Email NVARCHAR(100) NOT NULL UNIQUE
)

CREATE TABLE AccountsTrips(
AccountId INT REFERENCES Accounts(Id) NOT NULL,
TripId INT  REFERENCES Trips(Id) NOT NULL,
Luggage INT NOT NULL CHECK(Luggage >= 0),
PRIMARY KEY (AccountId,TripId)
)


--2
INSERT INTO Accounts(FirstName,MiddleName,LastName,CityId,BirthDate,Email)
VALUES
('John','Smith','Smith',34,'1975-07-21','j_smith@gmail.com'),
('Gosho',NULL,'Petrov',11,'1978-05-16 ','g_petrov@gmail.com'),
('Ivan','Petrovich','Pavlov',59,'1849-09-26','i_pavlov@softuni.bg'),
('Friedrich','Wilhelm','Nietzsche',2 ,'1844-10-15 ','f_nietzsche@softuni.bg')


INSERT INTO Trips(RoomId,BookDate,ArrivalDate,ReturnDate,CancelDate)
VALUES
(101,'2015-04-12','2015-04-14','2015-04-20','2015-02-02'),
(102,'2015-07-07','2015-07-15','2015-07-22 ','2015-04-29'),
(103,'2013-07-17','2013-07-23','2013-07-24',NULL),
(104,'2012-03-17','2012-03-31','2012-04-01','2012-01-10'),
(109,'2017-08-07','2017-08-28','2017-08-29',NULL)


--3
UPDATE Rooms
SET Price = (Price * 1.14)
WHERE HotelId IN (5,7,9)


--4
DELETE FROM AccountsTrips WHERE AccountId = 47


--5
   SELECT 
		 FirstName,
		 LastName,
		 FORMAT(BirthDate,'MM-dd-yyyy'),
		 c.Name AS [HomeTown],
		 Email
     FROM Accounts AS a
     JOIN Cities AS c ON a.CityId = c.Id
    WHERE SUBSTRING(a.Email,1,1) = 'e'
 ORDER BY c.[Name]

 --6
  SELECT c.[Name]
         ,COUNT(h.id) AS [Hotels]
    FROM Cities AS c
    JOIN Hotels AS h ON c.Id = h.CityId
GROUP BY c.[Name]
ORDER BY Hotels DESC,C.Name

--7
SELECT a.Id AS [AccountId],
       a.LastName + ' ' + a.LastName,
	   MAX(DATEDIFF(DAY,ArrivalDate,ReturnDate)) AS [LongestTrip] ,
	   MIN(DATEDIFF(DAY,ArrivalDate,ReturnDate)) AS [ShortestTrip]

  FROM Accounts AS a 
  JOIN AccountsTrips AS act ON a.Id = act.AccountId 
  JOIN Trips AS t ON act.TripId = t.Id
  WHERE a.MiddleName IS NULL AND t.CancelDate IS NULL
  GROUP BY a.Id,a.FirstName,a.LastName
  ORDER BY LongestTrip DESC,ShortestTrip
  

  --7
