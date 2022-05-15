
CREATE DATABASE TableRelations

USE TableRelations

--1
CREATE TABLE Passports(
PassportID INT PRIMARY KEY NOT NULL,
PassportNumber CHAR(8) NOT NULL,
)

 
CREATE TABLE Persons(
PersonID INT PRIMARY KEY IDENTITY NOT NULL,
FirstName VARCHAR(50) NOT NULL,
Salary DECIMAL(8,2) NOT NULL,
PassportID INT FOREIGN KEY REFERENCES Passports(PassportID) UNIQUE NOT NULL
)

INSERT INTO Passports(PassportID,PassportNumber)
VALUES
(101,'N34FG21B'),
(102,'K65LO4R7'),
(103,'ZE657QP2')

INSERT INTO Persons(FirstName,Salary,PassportID)
VALUES
('Roberto',43300,102)
,('Tom',56100,103)
,('Yana',62200,101)

--2

CREATE TABLE Manufacturers(
ManufacturererID INT PRIMARY KEY IDENTITY NOT NULL,
[Name] NVARCHAR(50) NOT NULL,
EstablishedOn DATE NOT NULL
)

CREATE TABLE Models(
ModelID INT PRIMARY KEY IDENTITY(101,1) NOT NULL,
[Name] NVARCHAR(30) NOT NULL,
ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturererID) NOT NULL
)


INSERT INTO Manufacturers([Name],EstablishedOn)
           VALUES
		   ('BMW','07/03/1916')
		   ,('Tesla','01/01/2003')
		   ,('Lada','01/05/1966')

INSERT INTO Models([Name],ManufacturerID)
           VALUES
		   ('x1',1)
		   ,('i6',1)
		   ,('Model S',2)
		   ,('Model X',2)
		   ,('Model 3', 2)
		   ,('Nova',3)

--3

CREATE TABLE Students(
StudentID INT PRIMARY KEY NOT NULL,
[Name] VARCHAR(30) NOT NULL
)

CREATE TABLE Exams(
ExamID INT PRIMARY KEY NOT NULL,
[Name] NVARCHAR(75) NOT NULL
)

CREATE TABLE StudentsExams(
StudentID INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL,
ExamID INT FOREIGN KEY REFERENCES Exams(ExamID) NOT NULL
PRIMARY KEY(StudentID,ExamID) 
)

INSERT INTO Students(StudentID,[Name])
      VALUES
	        (1,'Mila')
	       ,(2,'Toni')
	       ,(3,'Ron')

INSERT INTO Exams(ExamID,[Name])
      VALUES
	       (101,'SpringMVC')
		   ,(102,'Neo4j')
		   ,(103,'Oracle 11g')



INSERT INTO StudentsExams(StudentID,ExamID)
      VALUES
	       (1,101)
		   ,(1,102)
		   ,(2,101)
		   ,(3,103)
		   ,(2,102)
		   ,(2,103)

--4
CREATE TABLE Teachers(
TeacherID INT PRIMARY KEY IDENTITY(101,1) NOT NULL,
[Name] VARCHAR(50) NOT NULL,
ManagerID INT FOREIGN KEY REFERENCES Teachers(TeacherID)
)


--5
CREATE DATABASE EXERCISE

USE EXERCISE

CREATE TABLE Cities(
    CityID INT PRIMARY KEY NOT NULL,
    [Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY NOT NULL,
    [Name] VARCHAR(50) NOT NULL,
  BirthDay DATE,
    CityID INT FOREIGN KEY REFERENCES Cities(CityID)
)

CREATE TABLE Orders(
   OrderID INT PRIMARY KEY NOT NULL,
CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE ItemTypes(
ItemTypeID INT PRIMARY KEY NOT NULL,
    [Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Items(
    ItemID INT PRIMARY KEY NOT NULL,
    [Name] VARCHAR(50) NOT NULL,
ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE OrderItems(
OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
ItemID  INT FOREIGN KEY REFERENCES Items(ItemID)
        PRIMARY KEY(OrderId,ItemID)
)









		 





