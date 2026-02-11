-- I CREATED DATABASE OLTP 

USE [OLTP]
GO
-- Transactions
CREATE TABLE Transactions (
    transactionid varchar(10),
    timestampsec datetime,
    customerid varchar(10),
    firstname varchar(100),
    surname varchar(100),
    shipping_state varchar(100),
    item varchar(100),
    [description] varchar(1000),
    retail_price float,
    loyalty_discount float
)

INSERT INTO [dbo].[Transactions]
SELECT *
FROM [dbo].[RAW_Transactions]

--NORMALIZATION 1NF INVESTIGATION

SELECT *
FROM Transactions;

SELECT COUNT (*)
FROM Transactions
--result 3455 rows

SELECT COUNT(*)
FROM 
(
	SELECT DISTINCT *
	FROM Transactions
) AS TMP_distinct
--result 3455 rows

-- 1NF CONFIRMED 


--Normalization 2NF 

SELECT COUNT (DISTINCT[customerid] )
FROM [dbo].[Transactions]
-- result 942 rows, customers count

SELECT *
FROM Transactions;
-- 2 NF NOT CONFIRMED
--SEPARATE CUSTOMER SPECIFIC COLUMNS

SELECT [customerid],
		[firstname],
		[surname],
		[shipping_state],
		[loyalty_discount]
INTO TMP 
FROM Transactions 
--3455 rows affected

SELECT * 
FROM TMP

--REMOVE DUPLICATES
SELECT DISTINCT *
INTO Customers
FROM TMP
-- result 942 rows

SELECT*
FROM Customers

--2NF CONFIRMED

--BACK TO THE TRANSACSIONS TABLE NOW
 SELECT*
 FROM Transactions

 --I REMOVE CUSTOMER SPECIFIC COUMNS 
 --BUT I ´LL LEAVE THE "CUSTOMERID" COLUMN

 ALTER TABLE Transactions
 DROP COLUMN firstname,
             surname,
			 shipping_state,
			 loyalty_discount

SELECT *
FROM Transactions
--2NF CONFIRMED


--DROP TMP TABLE
DROP TABLE TMP

--Normalization 3NF

SELECT *
FROM Customers

--3NF CONFIRMED

SELECT *
FROM Transactions

-- TRANSITIVE DEPENDECIES TO BE MOVED TO NEW TABLE

SELECT item,	
		description,
		retail_price 
INTO TMP
FROM Transactions
-- result 3455 rows affected

SELECT *
FROM TMP

--TO MAKE A NEW TABLE 1NF -REMOVE DUPLICATES

SELECT DISTINCT *
INTO Items
FROM TMP

--(126 rows affected)

--CHECK
SELECT *
FROM Items 
--3NF CONFIRMED

--I REMOVE EXTRACTED ROWS FROM TRANSACTION TABLE
--BUT  I KEEP THE FOREIGN KEY "ITEM"

ALTER TABLE Transactions
DROP COLUMN [description],
			[retail_price]

SELECT*
FROM Transactions
--3 NF CONFIRMED

DROP TABLE TMP




