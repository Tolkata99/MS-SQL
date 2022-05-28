USE [Gringotts]

--1
 SELECT COUNT(*) AS [Count] 
 FROM [WizzardDeposits]

--2
 SELECT MAX(MagicWandSize) AS [LongestMagicWand]
 FROM [WizzardDeposits]       

--3
  SELECT
          [DepositGroup]
	      ,MAX([MagicWandSize]) AS [LongestMagicWand]
     FROM [WizzardDeposits]
 GROUP BY [DepositGroup]
