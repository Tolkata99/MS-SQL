CREATE DATABASE [WMS]



USE [WMS]

CREATE TABLE [Clients](
    [ClientId] INT PRIMARY KEY NOT NULL IDENTITY
  ,[FirstName] VARCHAR(50) NOT NULL
   ,[LastName] VARCHAR(50) NOT NULL
   ,[Phone] CHAR(12) NOT NULL
   ,CHECK (LEN([Phone]) = 12)
 )

 CREATE TABLE [Mechanics](
  [MechanicId] INT PRIMARY KEY NOT NULL IDENTITY
  ,[FirstName] VARCHAR(50) NOT NULL
   ,[LastName] VARCHAR(50) NOT NULL
   ,[Address] VARCHAR(255) NOT NULL
   )

   

   CREATE TABLE [Models](
   [ModelId] INT PRIMARY KEY NOT NULL IDENTITY
   ,[Name] VARCHAR(50) UNIQUE NOT NULL
   )

   CREATE TABLE [Jobs](
   [JobId] INT PRIMARY KEY NOT NULL IDENTITY 
   ,[ModelId] INT FOREIGN KEY REFERENCES [Models]([ModelId]) NOT NULL
   ,[Status] VARCHAR(11) NOT NULL DEFAULT('Pending')
   ,[ClientId] INT FOREIGN KEY REFERENCES [Clients]([ClientId]) NOT NULL
   ,[MechanicId] INT FOREIGN KEY REFERENCES [Mechanics]([MechanicId]) 
   ,[IssueDate] DATETIME2 NOT NULL
   ,[FinishDate] DATETIME2
   ,CHECK ([Status] IN ('Pending', 'Finished','In Progress'))
   )
  
   CREATE TABLE [Orders](
   [OrderId] INT PRIMARY KEY NOT NULL IDENTITY
   ,[JobId] INT FOREIGN KEY REFERENCES [Jobs]([JobId]) NOT NULL
   ,[IssueDate] DATETIME2 
   ,[Delivered] BIT NOT NULL DEFAULT(0)
   )

   CREATE TABLE [Vendors](
   [VendorId] INT PRIMARY KEY NOT NULL IDENTITY,
   [Name] VARCHAR(50) NOT NULL UNIQUE
   )

   CREATE TABLE [Parts](
   [PartId] INT PRIMARY KEY NOT NULL IDENTITY,
   [SerialNumber] VARCHAR(50) NOT NULL UNIQUE,
   [Description] VARCHAR(255),
   [Price] DECIMAL(4,2),
   [VendorId] INT FOREIGN KEY REFERENCES [Vendors](VendorId) NOT NULL,
   [StockQty] INT NOT NULL DEFAULT(0),
   CHECK ([Price] > 0),
   CHECK ([StockQty] >= 0)
   )
 
 CREATE TABLE [OrderParts](
 [OrderId] INT FOREIGN KEY REFERENCES [Orders]([OrderId]) NOT NULL,
 [PartId] INT FOREIGN KEY REFERENCES [Parts]([PartId]) NOT NULL,
 [Quantity] INT NOT NULL DEFAULT(1),
 PRIMARY KEY([PartId],[OrderId]),
 CHECK ([Quantity] > 0)
 )

 CREATE TABLE [PartsNeeded](
 [JobId] INT FOREIGN KEY REFERENCES [Jobs]([JobId]) NOT NULL
 ,[PartId] INT FOREIGN KEY REFERENCES [Parts]([PartId]) NOT NULL
 ,[Quantity] INT NOT NULL DEFAULT(1)
 ,PRIMARY KEY ([PartId],[JobId])
 ,CHECK ([Quantity] > 0)
 )


 --1
 USE WMS
 INSERT INTO [Clients]([FirstName],[LastName],[Phone])
 VALUES
('Teri','Ennaco',570-889-5187),
('Merlyn','Lawler',201-588-7810 ),
('Georgene','Montezuma',925-615-5185),
('Jettie','Mconnell',908-802-3564),
('Lemuel','Latzke',631-748-6479 ),
('Melodie ','Latzke',805-690-1682),
('Candida','Corbley',908-275-8357 )

INSERT INTO [Parts]([SerialNumber],[Description],[Price],[VendorId])
VALUES
('WP8182119','Door Boot Seal',117.86,2),
('W10780048 ','Suspension Rod',42.81,1),
('W10841140','Silicone Adhesive',6.77,4),
('WPY055980','High Temperature Adhesive',13.94,3)

