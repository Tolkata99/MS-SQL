
--Problem 15.	Hotel Database

CREATE DATABASE [Hotel]
GO

USE [Hotel]

CREATE TABLE [Employees](
[Id] INT PRIMARY KEY NOT NULL IDENTITY,
[FirstName] NVARCHAR(50) NOT NULL,
[LastName] NVARCHAR(50) NOT NULL,
[Title] VARCHAR(30) NOT NULL,
[Notes] VARCHAR(MAX)
)

INSERT INTO [Employees]([FirstName],[LastName],[Title])
VALUES
('Anatoli','Mihaylov','Seniour'),
('sdfs','sdasadsdasd','asdasd'),
('dsasda','sssss','Sensdadiour')


CREATE TABLE [Customers](
[AccountNumber] INT PRIMARY KEY NOT NULL IDENTITY,
[FirstName] NVARCHAR(50) NOT NULL,
[LastName] NVARCHAR(50) NOT NULL,
[PhoneNumber] NVARCHAR(20),
[EmergencyName] NVARCHAR(50),
[EmergencyNumber] NVARCHAR(30) NOT NULL,
[Notes] VARCHAR(MAX),
)

INSERT INTO [Customers]([FirstName],[LastName],[PhoneNumber],[EmergencyNumber])
VALUES
('Georgi', 'Ivanov', '*88', '123'),
('Maria', 'Ivanova', '123', '3333'),
('Georgi', 'Dimitrov', '1111', '32131')

CREATE TABLE [RoomStatus](
[RoomStatus] VARCHAR(20) PRIMARY KEY NOT NULL,
[Notes] VARCHAR(MAX)
)

INSERT INTO [RoomStatus]([RoomStatus])
VALUES
('Clean'),
('Dirty'),
('Unavailable')

CREATE TABLE [RoomTypes](
[RoomType] VARCHAR(20) PRIMARY KEY NOT NULL,
[Notes] VARCHAR(MAX)
)

INSERT INTO [RoomTypes]([RoomType])
VALUES
('Regular'),
('Luxury'),
('VIP')

CREATE TABLE [BedTypes](
[BedType] VARCHAR(20) PRIMARY KEY NOT NULL,
[Notes] VARCHAR(MAX)
)

INSERT INTO [BedTypes]([BedType])
VALUES
('Single'),
('Double'),
('King size')

CREATE TABLE [Rooms](
[RoomNumber] INT PRIMARY KEY NOT NULL IDENTITY,
[RoomType] VARCHAR(20) FOREIGN KEY REFERENCES [RoomTypes]([RoomType])NOT NULL,
[BedType] VARCHAR(20) FOREIGN KEY REFERENCES [BedTypes]([BedType]) NOT NULL,
[Rate] DECIMAL(7,2) NOT NULL,
[RoomStatus] VARCHAR(20) FOREIGN KEY REFERENCES [RoomStatus]([RoomStatus]) NOT NULL,
[Notes] VARCHAR(MAX)
)

INSERT INTO Rooms([RoomType],[BedType],[Rate],[RoomStatus])
VALUES
('Luxury', 'Double', 55.223, 'Clean'),
('Regular', 'King size', 89.223, 'Dirty'),
('VIP', 'Single', 333.223, 'Unavailable')

CREATE TABLE [Payments](
[Id] INT PRIMARY KEY NOT NULL IDENTITY,
[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id]) NOT NULL,
[PaymentDate] DATETIME2 NOT NULL,
[AccountNumber] INT FOREIGN KEY REFERENCES [Customers]([AccountNumber]) NOT NULL,
[FirstDateOccupied] DATETIME2,
[LastDateOccupied] DATETIME2,
[TotalDays] AS DATEDIFF(day,[FirstDateOccupied],[LastDateOccupied]),
[AmmountCharged] DECIMAL(7,2),
[TaxRate] DECIMAL(7,2),
[TaxAmount] DECIMAL(7,2),
[PaymentTotal] DECIMAL(7,2),
[Notes] VARCHAR(MAX)
)

INSERT INTO Payments ([EmployeeId], [PaymentDate], [AccountNumber], [FirstDateOccupied], [LastDateOccupied], [AmmountCharged])
VALUES
(1, '2016-03-21', 1,'2016-03-22', '2016-03-27', 666.45),
(2, '2006-04-11', 2, '2006-04-12', '2006-04-22', 1444.45),
(3, '2017-08-26', 3, '2017-08-26', '2017-08-29', 166.45)

CREATE TABLE [Occupancies]
(
[Id] int PRIMARY KEY IDENTITY,
[EmployeeId] int FOREIGN KEY REFERENCES [Employees]([Id]) NOT NULL,
[DateOccupied] date,
[AccountNumber] int FOREIGN KEY REFERENCES [Customers]([AccountNumber]) NOT NULL,
[RoomNumber] int FOREIGN KEY REFERENCES [Rooms]([RoomNumber]),
[RateApplied] decimal (7,2) NOT NULL,
[PhoneCharge] decimal (7,2),
[Notes] varchar(max)
)

INSERT INTO [Occupancies]([EmployeeId], [AccountNumber], [RoomNumber], [RateApplied])
VALUES
(1, 1, 1, 45.66),
(2, 2, 2, 115.10),
(3, 3, 3, 239.25)
--Problem 19.	Basic Select All Fields

USE [SoftUni]

SELECT * FROM [Towns]
SELECT * FROM [Departments]
SELECT * FROM [Employees]

--Problem 24.	Delete All Records
USE Hotel

TRUNCATE TABLE Occupancies
