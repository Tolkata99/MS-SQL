USE [Gringotts]

--1
 SELECT COUNT(*) AS [Count] 
   FROM [WizzardDeposits]

--2
 SELECT MAX(MagicWandSize) AS [LongestMagicWand]
   FROM [WizzardDeposits]       

--3
   SELECT   [DepositGroup]
	      ,MAX([MagicWandSize]) AS [LongestMagicWand]
     FROM [WizzardDeposits]
 GROUP BY [DepositGroup]

 --4

     SELECT TOP (2) [DepositGroup]              
		   FROM [WizzardDeposits]
       GROUP BY [DepositGroup]
       ORDER BY AVG([MagicWandSize])

--5
  SELECT [DepositGroup]
         ,SUM([DepositAmount]) AS [TotalSum]
    FROM [WizzardDeposits]
GROUP BY [DepositGroup]

--6
  SELECT [DepositGroup]
         ,SUM([DepositAmount]) AS [TotalSum]
    FROM [WizzardDeposits]
   WHERE [MagicWandCreator] = 'Ollivander family'
GROUP BY [DepositGroup]

--7
   SELECT [DepositGroup]
          ,SUM([DepositAmount]) AS [TotalSum] 
     FROM [WizzardDeposits]
	WHERE [MagicWandCreator] = 'Ollivander family'
 GROUP BY [DepositGroup]
   HAVING SUM([DepositAmount]) < 150000
 ORDER BY [TotalSum] DESC







